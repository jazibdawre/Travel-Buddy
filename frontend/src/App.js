import React from 'react'
import {Route} from 'react-router-dom';
import Landing from './pages/landing/Landing';

function App() {
  return (
    <React.Fragment>
         <Route exact path='/' component={Landing} />
    </React.Fragment>
  )
}

export default App
