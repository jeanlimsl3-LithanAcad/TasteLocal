from django import forms
from .models import Booking


class BookingForm(forms.ModelForm):
    class Meta:
        model = Booking
        fields = ['booking_date', 'number_of_guests']
        widgets = {
            'booking_date': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
            'number_of_guests': forms.NumberInput(attrs={'class': 'form-control', 'min': '1'}),
        }