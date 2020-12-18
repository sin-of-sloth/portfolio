from django.shortcuts import render
from .models import Project

def home(request):
    projects = Project.objects.all()
    if(request.COOKIES.get('theme', 'NULL') == 'NULL'):
        request.COOKIES['theme'] = 'dark'
    return render(request, 'portfolio/home.html', {'projects':projects})