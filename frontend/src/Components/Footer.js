import React from 'react';
import { Container, Row, Col } from 'react-bootstrap';

const Footer = () => {
	return (
		<footer>
			<Container>
				<Row>
					<Col className="text-center py-3" style={{color:'#ff7d27'}}>
						Copyright &copy; Travel Buddy
					</Col>
				</Row>
			</Container>
		</footer>
	);
};

export default Footer;
