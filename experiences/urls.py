from django.urls import path
from . import views

urlpatterns = [
    path('<int:id>/', views.experience_detail, name='experience_detail'),
]