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

const myAppName = 'LOST N FOUND';
const myDescription = '';
const myColor = '#343a40';

const paymentHandler = async (amnt) => {
	const orderAmount = amnt;
	const API_URL = 'http://localhost:5000/';
	// e.preventDefault();
	const orderUrl = `${API_URL}order`;
	const response = await axios.get(orderUrl, {
		params: { amount: orderAmount },
	});
	const { data } = response;
	const options = {
		key: process.env.RAZOR_PAY_TEST_KEY,
		name: myAppName,
		description: myDescription,
		order_id: data.id,

		handler: async (response) => {
			try {
				const paymentId = response.razorpay_payment_id;
				const url = `${API_URL}capture/${paymentId}`;
				const captureResponse = await axios.post(url, {});
				console.log(captureResponse.data);
			} catch (err) {
				console.log(err);
			}
		},
		theme: {
			color: myColor,
		},
	};
	const rzp1 = new window.Razorpay(options);
	rzp1.open();
};

const handleGift = () => {
	Swal.mixin({
		input: 'number',
		confirmButtonText: 'Pay &rarr;',
		allowOutsideClick: false,
		allowEscapeKey: false,
		// progressSteps: ['1']
	})
		.queue([
			{
				title: 'Show your love',
				text: 'Enter the amount',
			},
		])
		.then((result) => {
			if (result.value) {
				const answers = result.value;
				console.log(answers[0]);
				paymentHandler(answers[0]);
			}
		});
};

const ProductScreen = ({ history, match }) => {
	const pickUpInit = { address: '', lat: 19.076, lng: 72.8777 };
	const [pickUp, setPickUp] = useState(pickUpInit);

	//Email id of User Logged In
	const [userName, setUsername] = useState('');
	const founder = '';

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

	const addToCartHandler = () => {
		history.push(`/cart/${match.params.id}?qty=${qty}`);
	};

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
		if (product && product.location)
			setPickUp({
				lat: product.location.coordinates[0],
				lng: product.location.coordinates[1],
			});
	}, [product]);

	const handleChat = (call) => {
		window.location.href = `tel:+${call}`;
	};

	// just added for development
	//------------------------
	//  loading=false;
	//  error=false;
	//  product={
	//    name:'Mumbai',
	//    image:'data:image/jpeg;base64,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',
	//    description:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
	//   }
	//   product.reviews=[]
	//   userInfo=true
	//------------------------
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
							<Card>
								<ListGroup variant="flush">
									{/* <ListGroup.Item>
                    <Row>
                      <Col>Founder:</Col>
                      <Col>
                        <strong>{product && product.user && product.user.name}</strong>
                      </Col>
                    </Row>
                  </ListGroup.Item> */}

									{/* <ListGroup.Item>
                    <Button
                      onClick={() => handleChat(product && product.user && product.user.phoneNo)}
                      className='btn-block'
                      type='button'
                    >
                      <i class="fas fa-phone fa-lg" /> &nbsp;Contact Founder
                    </Button>
                  </ListGroup.Item>

                  <ListGroup.Item>
                    <Button
                      onClick={() => handleGift()}
                      className='btn-block'
                      type='button'
                    >
                      <i class="fas fa-gift fa-lg" /> &nbsp;Gift Founder
                    </Button>
                  </ListGroup.Item> */}
								</ListGroup>
							</Card>
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
															<ListGroup.Item
																key={review}
															>
																<strong>
																	{review}
																</strong>
															</ListGroup.Item>
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
															<ListGroup.Item
																key={review}
															>
																<strong>
																	{review}
																</strong>
															</ListGroup.Item>
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
											Hello! I'm the body
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
							<Weather
								location={pickUpInit}
								name={product.name}
							/>
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
					</Row>
				</>
			)}
		</>
	);
};

export default ProductScreen;
