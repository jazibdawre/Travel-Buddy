from django.shortcuts import render
from django.http import HttpResponse
import json
from rest_framework.decorators import api_view
from rest_framework.response import Response
import numpy as np
from tensorflow import keras
import os

# Create your views here.
@api_view(['GET'])
def index_page(request):
    return_data = {
        "error" : "0",
        "message" : "Successful",
    }
    return Response(return_data)

@api_view(["POST"])
def predictions(request): 
    try:
        user_id = 0
        user_id = int(request.data.get('user_id', None))
        course_arr = [1, 2, 3, 4, 5, 6]
        fields = [course_arr, user_id]
        print(fields)
        print(os.getcwd())
        if not None in fields:
            model = keras.models.load_model("model")
            course_arr = np.array(course_arr) #you get in request
            user = np.array([user_id for i in range(len(course_arr))])
            pred = model.predict([course_arr, user])
            pred = pred.reshape(-1) #reshape to single dimension
            pred_ids = (-pred).argsort()[0:5]   #Top 5 courses
            
            predictions = {
                'error' : '0',
                'message' : 'Successful',
                'pred_ids' : pred_ids
            }
        else:
            predictions = {
                'error' : '1',
                'message': 'Invalid Parameters'                
            }
    except Exception as e:
        predictions = {
            'error' : '2',
            "message": str(e)
        }
    return Response(predictions)  