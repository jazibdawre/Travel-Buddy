import React, { useState } from "react";
import { Button, Form } from "react-bootstrap";

function Create() {
  //Creating Main Array
  const [qState, setQState] = useState([]);
  //State for Text-Area
  const [textContent, setTextContent] = useState("");
  //State for Drop-Down
  const [selectItem, setSelectItem] = useState("");

  function handleChange(event) {
    const value = event.target.value;
    setTextContent(value);
  }

  function onClick(event) {
    setQState((prevVal) => {
      const a = [...prevVal];
      a.push({
        content: textContent,
        type: selectItem,
        ans: ""
      });
      setTextContent("");
      setSelectItem("select");
      return a;
    });
  }

  function onSubmit(event) {
    event.preventDefault();
    console.log(qState);
  }

  function handleSelect(event) {
    const value = event.target.value;
    setSelectItem(value);
  }

  return (
    <Form onSubmit={onSubmit}>
      <Form.Group controlId="">
        <Form.Label>Enter the attractions to be added</Form.Label>

        <Form.Control
          as="textarea"
          row="3"
          onChange={handleChange}
          value={textContent}
        ></Form.Control>
      </Form.Group>
      <Button variant='primary' onClick={onClick}>
        Add
      </Button>

      <Button variant="success" type="submit" style={{margin: '1rem'}}>
        Submit
      </Button>

      {qState.map((question, index) => {
        return (
          <Form.Group controlId={index} key={index}>
            <Form.Label>{question.content}</Form.Label>
          </Form.Group>
        );
      })}
    </Form>
  );
}

export default Create;