import axios from 'axios';
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Form, Button, Container, Row, Col } from 'react-bootstrap';
import { useDispatch, useSelector } from 'react-redux';
import Message from '../components/Message';
import Loader from '../components/Loader';
import FormContainer from '../components/FormContainer';
import { listProductDetails, createProduct } from '../actions/productActions';
import { PRODUCT_UPDATE_RESET } from '../constants/productConstants';
import MyMap from '../components/map/map3';
import Create from '../components/Create';
import Convert from '../components/Convert';

const Expense = ({ match, history }) => {
	const pickUpInit = { address: '', lat: 0, lng: 0 };
	const [pickUp, setPickUp] = useState(pickUpInit);
	const dropInit = { address: '', lat: 0, lng: 0 };
	const [drop, setDrop] = useState(dropInit);
	const [mapInit, setMapInit] = useState(false);
	const productId = match.params.id;

	const [name, setName] = useState('');
	const [price, setPrice] = useState(0);
	const [image, setImage] = useState('');
	const [brand, setBrand] = useState('');
	const [category, setCategory] = useState('');
	const [amount, setAmount] = useState(0);
	const [description, setDescription] = useState('');
	const [uploading, setUploading] = useState(false);

	const dispatch = useDispatch();

	const productUpdate = useSelector((state) => state.productUpdate);
	const {
		loading: loadingUpdate,
		error: errorUpdate,
		success: successUpdate,
	} = productUpdate;

	useEffect(() => {
		if (successUpdate) {
			dispatch({ type: PRODUCT_UPDATE_RESET });
			history.push('/admin/productlist');
		}
	}, [dispatch, history, successUpdate]);

	const uploadFileHandler = async (e) => {
		const file = e.target.files[0];
		const formData = new FormData();
		formData.append('image', file);
		setUploading(true);

		try {
			const config = {
				headers: {
					'Content-Type': 'multipart/form-data',
				},
			};

			const { data } = await axios.post('/api/upload', formData, config);

			setImage(data);
			setUploading(false);
		} catch (error) {
			console.error(error);
			setUploading(false);
		}
	};

	const submitHandler = (e) => {
		e.preventDefault();
		dispatch(
			createProduct({
				name,
				price,
				image,
				brand,
				category,
				description,
				location: {
          type: "Point",
          coordinates: [19.076, 72.8777],
        },
			})
		);
	};

	return (
		<>
			<Link to="/admin/productlist" className="btn btn-light my-3">
				Go Back
			</Link>
			<Container>
				<Row className="justify-content-md-center">
					<Col xs={12} md={6}>
						<h1>Add Expense</h1>
						{loadingUpdate && <Loader />}
						{errorUpdate && (
							<Message variant="danger">{errorUpdate}</Message>
						)}
						{
							<Form onSubmit={submitHandler}>
								<Form.Group controlId="name">
									<Form.Label>Name</Form.Label>
									<Form.Control
										type="Expense Name"
										placeholder="Enter expense name"
										value={name}
										onChange={(e) =>
											setName(e.target.value)
										}
									></Form.Control>
                                </Form.Group>


								<Form.Group controlId="category">
									<Form.Label>Category</Form.Label>
									<Form.Control
										type="text"
										placeholder="Enter category"
										value={category}
										onChange={(e) =>
											setCategory(e.target.value)
										}
									></Form.Control>
								</Form.Group>

								<Form.Group controlId="description">
									<Form.Label>Description</Form.Label>
									<Form.Control
										type="text"
										placeholder="Enter description"
										value={description}
										onChange={(e) =>
											setDescription(e.target.value)
										}
									></Form.Control>
									<Convert />
								</Form.Group>

								<Button type="submit" variant="primary">
									Add
								</Button>
							</Form>
						}
					</Col>
					
				</Row>
			</Container>
		</>
	);
};

export default Expense;
