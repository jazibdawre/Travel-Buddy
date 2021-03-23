import React, { useState, useEffect } from 'react';
import {
	Table,
	Form,
	Button,
	Row,
	Col,
	Card,
	Accordion,
} from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';
import { useDispatch, useSelector } from 'react-redux';
import Message from '../components/Message';
import Loader from '../components/Loader';
import { getUserDetails, updateUserProfile } from '../actions/userActions';
import { listMyOrders } from '../actions/orderActions';
import { USER_UPDATE_PROFILE_RESET } from '../constants/userConstants';
import {
	listTopProducts,
	deleteProduct,
	createProduct,
} from '../actions/productActions';

const ProfileScreen = ({ location, history }) => {
	const [name, setName] = useState('');
	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');
	const [confirmPassword, setConfirmPassword] = useState('');
	const [message, setMessage] = useState(null);

	const dispatch = useDispatch();

	const userDetails = useSelector((state) => state.userDetails);
	const { loading, error, user } = userDetails;

	const userLogin = useSelector((state) => state.userLogin);
	const { userInfo } = userLogin;

	const userUpdateProfile = useSelector((state) => state.userUpdateProfile);
	const { success } = userUpdateProfile;

	const orderListMy = useSelector((state) => state.orderListMy);
	const { loading: loadingOrders, error: errorOrders, orders } = orderListMy;

	useEffect(() => {
		if (!userInfo) {
			history.push('/login');
		} else {
			if (!user || !user.name || success) {
				dispatch({ type: USER_UPDATE_PROFILE_RESET });
				dispatch(getUserDetails(userInfo._id));
				dispatch(listMyOrders());
			} else {
				setName(user.name);
				setEmail(user.email);
			}
		}
	}, [dispatch, history, userInfo, user, success]);

	const submitHandler = (e) => {
		e.preventDefault();
		if (password !== confirmPassword) {
			setMessage('Passwords do not match');
		} else {
			dispatch(
				updateUserProfile({ id: user._id, name, email, password })
			);
		}
	};

	const deleteHandler = (id) => {
		if (window.confirm('Are you sure')) {
			dispatch(deleteProduct(id));
		}
	};

	const createProductHandler = () => {
		//dispatch(createProduct());
		history.push(`/expense/create`);
	};

	const products = [
		{
			_id: '1',
			name: 'Carte Resto',
			user: {
				name: '',
			},
			category: {
				name: 'Game',
			},
			amount: {
				curr: 'USD',
				amt: 10,
			},
		},
	];

	return (
		<Row>
			<Col md={3}>
				<h2>User Profile</h2>
				{message && <Message variant="danger">{message}</Message>}
				{}
				{success && (
					<Message variant="success">Profile Updated</Message>
				)}
				{loading ? (
					<Loader />
				) : error ? (
					<Message variant="danger">{error}</Message>
				) : (
					<Form onSubmit={submitHandler}>
						<Form.Group controlId="name">
							<Form.Label>Name</Form.Label>
							<Form.Control
								type="name"
								placeholder="Enter name"
								value={name}
								onChange={(e) => setName(e.target.value)}
							></Form.Control>
						</Form.Group>

						<Form.Group controlId="email">
							<Form.Label>Email Address</Form.Label>
							<Form.Control
								type="email"
								placeholder="Enter email"
								value={email}
								onChange={(e) => setEmail(e.target.value)}
							></Form.Control>
						</Form.Group>

						<Form.Group controlId="password">
							<Form.Label>Password</Form.Label>
							<Form.Control
								type="password"
								placeholder="Enter password"
								value={password}
								onChange={(e) => setPassword(e.target.value)}
							></Form.Control>
						</Form.Group>

						<Form.Group controlId="confirmPassword">
							<Form.Label>Confirm Password</Form.Label>
							<Form.Control
								type="password"
								placeholder="Confirm password"
								value={confirmPassword}
								onChange={(e) =>
									setConfirmPassword(e.target.value)
								}
							></Form.Control>
						</Form.Group>

						<Button type="submit" variant="primary">
							Update
						</Button>
					</Form>
				)}
			</Col>
			<Col md={9}>
				<h2>My Expenses</h2>
				{false ? (
					<Loader />
				) : false ? (
					<Message variant="danger">{errorOrders}</Message>
				) : (
					<>
						<Accordion defaultActiveKey="0">
							<Card>
								<Card.Header>
									<Accordion.Toggle
										as={Button}
										variant="link"
										eventKey="0"
									>
										Mumbai
									</Accordion.Toggle>
								</Card.Header>
								<Accordion.Collapse eventKey="0">
									<Card.Body>
										<div className="container">
											Expenses
											<Button
												className="ml-3 my-3 btn-sm align-self-end"
												onClick={createProductHandler}
											>
												<i className="fas fa-plus"></i>{' '}
												Add Expense
											</Button>
										</div>

										<Table
											striped
											bordered
											hover
											responsive
											className="table-sm"
										>
											<thead>
												<tr>
													<th>ID</th>
													<th>Expense</th>
													<th>Amount</th>
													<th>Currency</th>
													<th>INR</th>

													<th>Edit</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												{products.map((product) => (
													<tr key={product._id}>
														<td>{product._id}</td>
														<td>{product.name}</td>
														<td>
															{product.amount.amt}
														</td>
														<td>
															{
																product.amount
																	.curr
															}
														</td>
														<td>72.44</td>
														<td>
															<LinkContainer
																to={`/admin/product/${product._id}/edit`}
															>
																<Button
																	variant="light"
																	className="btn-sm"
																>
																	<i className="fas fa-edit"></i>
																</Button>
															</LinkContainer>
															<Button
																variant="danger"
																className="btn-sm"
																onClick={() => {}}
															>
																<i className="fas fa-trash"></i>
															</Button>
														</td>
													</tr>
												))}
											</tbody>
										</Table>
									</Card.Body>
								</Accordion.Collapse>
							</Card>
						</Accordion>
					</>
				)}
			</Col>
		</Row>
	);
};

export default ProfileScreen;
