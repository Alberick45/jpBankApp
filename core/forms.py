from .models import TblCustomers086

from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import User
from django.contrib.auth import authenticate


class RegisterForm(UserCreationForm):
    phone = forms.CharField(max_length=20, required=True)

    class Meta:
        model = User
        fields = ['username', 'email', 'phone', 'password1', 'password2']

    def __init__(self, *args, **kwargs):
        super(RegisterForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs.update({'class': 'border p-2 rounded w-full'})

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError('Email is already in use.')
        return email

    def clean_phone(self):
        phone = self.cleaned_data.get('phone')
        if User.objects.filter(phone=phone).exists():
            raise forms.ValidationError('Phone number is already in use.')
        return phone


class LoginForm(forms.Form):
    email = forms.EmailField(required=True)
    password = forms.CharField(widget=forms.PasswordInput, required=True)

    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get('email')
        password = cleaned_data.get('password')

        if email and password:
            user = authenticate(email=email, password=password)
            if user is None:
                raise forms.ValidationError('Invalid email or password.')
        return cleaned_data


class CustomerForm(forms.ModelForm):
    class Meta:
        model = TblCustomers086
        fields = ['full_name', 'dob', 'gender', 'nationality', 'email', 'phone', 'address']

    def __init__(self, *args, **kwargs):
        super(CustomerForm, self).__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            field.widget.attrs.update({'class': 'border p-2 rounded w-full'})

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if TblCustomers086.objects.filter(email=email).exists():
            raise forms.ValidationError('Email is already in use.')
        return email

    def clean_phone(self):
        phone = self.cleaned_data.get('phone')
        if TblCustomers086.objects.filter(phone=phone).exists():
            raise forms.ValidationError('Phone number is already in use.')
        return phone
