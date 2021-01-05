"""personal_portfolio URL Configuration
"""

from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from portfolio import views

app_name = 'portfolio'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('mail', views.mail, name='mail'),
    path('mailer', views.mailer, name='mailer'),
    path('blog/', include('blog.urls')),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)