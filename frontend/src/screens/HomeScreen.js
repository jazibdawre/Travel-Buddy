import React, { useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { Row, Col, Container } from 'react-bootstrap';
import Product from '../components/Product';
import Message from '../components/Message';
import Loader from '../components/Loader';
import ProductCarousel from '../components/ProductCarousel';
import About from './landing/About';
import Meta from '../components/Meta';
import { listProducts } from '../actions/productActions';
import { useParams } from 'react-router-dom';

const HomeScreen = ({ match }) => {
	const keyword = match.params.keyword || '';

	const filter = match.params.filter || '';

	const dispatch = useDispatch();

	const productList = useSelector((state) => state.productList);
	const { loading, error, products, page, pages } = productList;

	useEffect(() => {
		dispatch(listProducts(keyword, null));
	}, [dispatch, keyword]);

	useEffect(() => {
		dispatch(listProducts(null, filter));
	}, [dispatch, filter]);

	useEffect(() => {
		console.log(keyword);
	}, [keyword]);

	return (
		<>
			<Meta />
			{!keyword && !filter ? (
				<>
					<About />
					<div style={{ marginTop: '20px' }}></div>
					<h1 style={{ textAlign: 'center', color: '#ff7d27' }}>
						Top Cities Of world
					</h1>
					<ProductCarousel />
				</>
			) : (
				<Link to="/" className="btn btn-light">
					Go Back
				</Link>
			)}
			<div style={{ marginTop: '20px' }}></div>
			<Container className="py-3">
				<h1>Recommended Cities</h1>
				{loading ? (
					<Loader />
				) : error ? (
					<Message variant="danger">{error}</Message>
				) : (
					<>
						<Row>
							{products.map((product) => (
								<Col
									key={product._id}
									sm={12}
									md={6}
									lg={4}
									xl={3}
								>
									<Product product={product} />
								</Col>
							))}
						</Row>
					</>
				)}
			</Container>
		</>
	);
};

export default HomeScreen;
