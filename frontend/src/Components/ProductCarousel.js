import React, { useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Carousel, Image } from 'react-bootstrap';
import { useDispatch, useSelector } from 'react-redux';
import Loader from './Loader';
import Message from './Message';
import { listTopProducts } from '../actions/productActions';
import a from '../screens/landing/img/1st-big-item.jpg';

// added for development
const cities=[
	{
		id:1,
		name:'Mumbai'
	},
	{
		id:2,
		name:'London'
	},
	{
		id:3,
		name:'USA'
	},
]
const ProductCarousel = () => {
	const dispatch = useDispatch();

	const productTopRated = useSelector((state) => state.productTopRated);
	let { loading, error, products } = productTopRated;
	// added for development
	//-------------
    loading=false;
	error=false;
    //------------

	useEffect(() => {
		dispatch(listTopProducts());
	}, [dispatch]);

	return loading ? (
		<Loader />
	) : error ? (
		<Message variant="danger">{error}</Message>
	) : (
		<Carousel pause="hover" className="bg-dark">
			{cities.map((city) => (
				<Carousel.Item key={city.id}>
					<Link to={`/product/${city.id}`}>
						<Image src={a} alt={city.name} fluid />
						<Carousel.Caption className="carousel-caption">
							<h2>{city.name}</h2>
						</Carousel.Caption>
					</Link>
				</Carousel.Item>
			))}
		</Carousel>
	);
};

export default ProductCarousel;
