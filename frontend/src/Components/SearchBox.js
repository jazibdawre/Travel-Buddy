import React, { useState } from 'react'
import { Form, Button } from 'react-bootstrap'

const SearchBox = ({ history }) => {
  const [keyword, setKeyword] = useState('');

  const submitHandler = (e) => {
    e.preventDefault()
    if (keyword.trim()) {
      history.push(`/search/${keyword}`)
    } else {
      history.push('/')
    }
  }

  return (
    <Form onSubmit={submitHandler} inline>
      <div className='acc-form'>
      <Form.Control
        type='text'
        name='q'
        onChange={(e) => setKeyword(e.target.value)}
        placeholder='Search Locations...'
        className='mr-sm-2 ml-sm-5'
        style={{width:'80%'}}
      ></Form.Control>
      </div>
      
      <Button type='submit' variant="outline-dark" className='p-2' style={{borderColor:'#ff7d27',color:'#ffd727'}}>
           Search
      </Button>
    </Form>
  )
}

export default SearchBox
