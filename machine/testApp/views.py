from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def methodinfo(request):  
    return HttpResponse("Http request is: " + request.method)  