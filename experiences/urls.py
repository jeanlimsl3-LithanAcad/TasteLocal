from django.urls import path
from . import views

urlpatterns = [
    path('<int:id>/', views.experience_detail, name='experience_detail'),
    path('api/experiences/', views.experience_list_api, name='experience_list_api'),
]