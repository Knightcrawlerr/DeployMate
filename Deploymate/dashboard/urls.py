from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='home'),
    path('trigger/', views.trigger_deployment, name='trigger'),
]

