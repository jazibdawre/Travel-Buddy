/* eslint-disable no-unused-vars */
import React, { useState, useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import {
	Row,
	Col,
	Image,
	ListGroup,
	Card,
	Button,
	Form,
	Accordion,
} from 'react-bootstrap';
import Rating from '../components/Rating';
import Message from '../components/Message';
import Loader from '../components/Loader';
import Meta from '../components/Meta';
import {
	listProductDetails,
	createProductReview,
} from '../actions/productActions';
import { PRODUCT_CREATE_REVIEW_RESET } from '../constants/productConstants';
import ApplicationComponent from '../components/ApplicationComponent';
import Swal from 'sweetalert2';
import axios from 'axios';
import MyMap from '../components/map/map2';
import ViewApp from '../components/ViewApp';
import Weather from '../components/Weather';
import PieChartBuilder from '../components/PieChartBuilder';

const myAppName = 'Travel Buddy';
const myDescription = '';
const myColor = '#343a40';

const ProductScreen = ({ history, match }) => {
	const pickUpInit = { address: '', lat: 19.076, lng: 72.8777 };
	const [pickUp, setPickUp] = useState(pickUpInit);

	const [qty, setQty] = useState(1);
	const [rating, setRating] = useState(0);
	const [comment, setComment] = useState('');

	const dispatch = useDispatch();

	const productDetails = useSelector((state) => state.productDetails);
	let { loading, error, product } = productDetails;

	const userLogin = useSelector((state) => state.userLogin);
	let { userInfo } = userLogin;

	const productReviewCreate = useSelector(
		(state) => state.productReviewCreate
	);
	const {
		success: successProductReview,
		loading: loadingProductReview,
		error: errorProductReview,
	} = productReviewCreate;

	useEffect(() => {
		if (successProductReview) {
			setRating(0);
			setComment('');
		}
		if (product && (!product._id || product._id !== match.params.id)) {
			dispatch(listProductDetails(match.params.id));
			dispatch({ type: PRODUCT_CREATE_REVIEW_RESET });
		}
	}, [dispatch, match, successProductReview]);

	const submitHandler = (e) => {
		e.preventDefault();
		dispatch(
			createProductReview(match.params.id, {
				rating,
				comment,
			})
		);
	};

	useEffect(() => {
		if (product && product.location && product.location.coordinates)
			setPickUp({
				lat: product.location.coordinates[1],
				lng: product.location.coordinates[0],
			});
	}, [product]);

	return (
		<>
			<Link className="btn btn-light my-3" to="/">
				Go Back
			</Link>
			{loading ? (
				<Loader />
			) : error ? (
				<Message variant="danger">{error}</Message>
			) : (
				<>
					<Meta title={product && product.name} />
					<Row>
						<Col md={6}>
							<Image
								style={{ height: '100%', width: '100%' }}
								src={product && product.image}
								alt={product && product.name}
								fluid
							/>
						</Col>
						<Col md={3}>
							<ListGroup variant="flush">
								<ListGroup.Item>
									<h3>{product && product.name}</h3>
								</ListGroup.Item>

								<ListGroup.Item>
									Description:{' '}
									{product && product.description}
								</ListGroup.Item>
							</ListGroup>
						</Col>
						<Col md={3}>
							<h4>Location</h4>
							<br />
							<Card>
								<ListGroup variant="flush">
									<MyMap pU={pickUp} />
								</ListGroup>
							</Card>
						</Col>
					</Row>
					<Row>
						<Col md={6} style={{ marginTop: '2rem' }}>
							<Accordion defaultActiveKey="0">
								<Card style={{ marginTop: '10px' }}>
									<Card.Header>
										<Accordion.Toggle
											as={Button}
											variant="link"
											eventKey="0"
										>
											Attractions
										</Accordion.Toggle>
									</Card.Header>
									<Accordion.Collapse eventKey="0">
										<Card.Body>
											<ListGroup variant="flush">
												{product &&
													product.attractions &&
													product.attractions.map(
														(review) => (
															<Card
																style={{
																	width:
																		'100%	',
																}}
															>
																<Card.Img
																	variant="top"
																	src={require(`../../public/images/${review}.jpg`)}
																/>
																<Card.Body>
																	<Card.Title>
																		{review}
																	</Card.Title>
																	<Card.Text>
																		Some
																		quick
																		example
																		text to
																		build on
																		the card
																		title
																		and make
																		up the
																		bulk of
																		the
																		card's
																		content.
																	</Card.Text>
																</Card.Body>
															</Card>
														)
													)}
											</ListGroup>
										</Card.Body>
									</Accordion.Collapse>
								</Card>
								<Card style={{ maginTop: '10px' }}>
									<Card.Header>
										<Accordion.Toggle
											as={Button}
											variant="link"
											eventKey="1"
										>
											Cuisine
										</Accordion.Toggle>
									</Card.Header>
									<Accordion.Collapse eventKey="1">
										<Card.Body>
											<ListGroup variant="flush">
												{product &&
													product.food &&
													product.food.map(
														(review) => (
															<Card
																style={{
																	width:
																		'100%	',
																}}
															>
																<Card.Img
																	variant="top"
																	src={require(`../../public/images/${review}.jpg`)}
																/>
																<Card.Body>
																	<Card.Title>
																		{review}
																	</Card.Title>
																	<Card.Text>
																		Some
																		quick
																		example
																		text to
																		build on
																		the card
																		title
																		and make
																		up the
																		bulk of
																		the
																		card's
																		content.
																	</Card.Text>
																</Card.Body>
															</Card>
														)
													)}
											</ListGroup>
										</Card.Body>
									</Accordion.Collapse>
								</Card>
								<Card
									style={{
										marginTop: '10px',
										marginBottom: '10px',
									}}
								>
									<Card.Header>
										<Accordion.Toggle
											as={Button}
											variant="link"
											eventKey="2"
										>
											Speciality
										</Accordion.Toggle>
									</Card.Header>
									<Accordion.Collapse eventKey="2">
										<Card.Body>
											<ListGroup variant="flush">
												{product &&
													product.specialities &&
													product.specialities.map(
														(speciality) => (
															<ListGroup.Item
																key={speciality}
															>
																<p>
																	{speciality}
																</p>
															</ListGroup.Item>
														)
													)}
											</ListGroup>
										</Card.Body>
									</Accordion.Collapse>
								</Card>
							</Accordion>
						</Col>

						<Col
							md={6}
							style={{
								marginTop: '2rem',
								justifyContent: 'flex-end',
							}}
						>
							<Weather location={pickUp} name={product.name} />
						</Col>
					</Row>
					<Row>
						<Col md={6}>
							{product.reviews.length === 0 && (
								<Message>No Reviews</Message>
							)}
							<ListGroup variant="flush">
								{product.reviews.map((review) => (
									<ListGroup.Item key={review._id}>
										<strong>{review.name}</strong>
										<Rating value={review.rating} />
										{/* <p>
											{review.createdAt.substring(0, 10)}
										</p> */}
										<p>{review.comment}</p>
									</ListGroup.Item>
								))}
							</ListGroup>
							<ListGroup.Item>
								<h2>Write a Customer Review</h2>
								{successProductReview && (
									<Message variant="success">
										Review submitted successfully
									</Message>
								)}
								{/* {loadingProductReview && <Loader />} */}
								{/* {errorProductReview && (
                    <Message variant='danger'>{errorProductReview}</Message>
                  )} */}
								{userInfo ? (
									<Form onSubmit={submitHandler}>
										<Form.Group controlId="rating">
											<Form.Label>Rating</Form.Label>
											<Form.Control
												as="select"
												value={rating}
												onChange={(e) =>
													setRating(e.target.value)
												}
											>
												<option value="">
													Select...
												</option>
												<option value="1">
													1 - Poor
												</option>
												<option value="2">
													2 - Fair
												</option>
												<option value="3">
													3 - Good
												</option>
												<option value="4">
													4 - Very Good
												</option>
												<option value="5">
													5 - Excellent
												</option>
											</Form.Control>
										</Form.Group>
										<Form.Group controlId="comment">
											<Form.Label>Comment</Form.Label>
											<Form.Control
												as="textarea"
												row="3"
												value={comment}
												onChange={(e) =>
													setComment(e.target.value)
												}
											></Form.Control>
										</Form.Group>
										<Button
											disabled={loadingProductReview}
											type="submit"
											variant="primary"
										>
											Submit
										</Button>
									</Form>
								) : (
									<Message>
										Please <Link to="/login">sign in</Link>{' '}
										to write a review{' '}
									</Message>
								)}
							</ListGroup.Item>
						</Col>
						<Col md={6}>
							<h3
								style={{
									textAlign: 'center',
									color: '#FF8E43',
									marginTop: '5px',
								}}
							>
								Covid-19 Statistics
							</h3>
							<PieChartBuilder />
						</Col>
					</Row>
				</>
			)}
		</>
	);
};

export default ProductScreen;
