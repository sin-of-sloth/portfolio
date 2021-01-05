from django.shortcuts import render, redirect
from .models import Project
from django.conf import settings 
from django.core.mail import send_mail
import re

def home(request):
    projects = Project.objects.all().order_by('order')
    response = render(request, 'portfolio/home.html', {'projects':projects})
    if(request.COOKIES.get('theme', '') == ''):
        response.set_cookie('theme', 'light')

    return response

def mail(request):
    return render(request, 'portfolio/mail.html')

def mailer(request):
    subject = request.POST.get('header', '')
    message = request.POST.get('body', '')
    mail = request.POST.get('email', '')
    error = ''
    regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w+$'

    if mail == '':
        error = 'Email address cannot be empty!'
    if not re.search(regex,mail):
        error = 'Invalid email address!'
    if subject == '':
        error = 'Subject cannot be empty!'
    if len(subject) > 78:
        error = 'Subject too long!'
    
    if not error == '':
        response = render(request, 'portfolio/mail.html', {'error':error})
    else:
        message += '\n\n FROM : ' + mail
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [settings.EMAIL_HOST_USER]
        send_mail(subject, message, email_from, recipient_list)
        response = redirect('home')
    
    return response