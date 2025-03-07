from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import RegisterForm, LoginForm
from .models import TblCustomers086, TblAccountDetails086, TblTransactions086

from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import TblCustomers086
from .forms import CustomerForm

class CustomerListView(ListView):
    model = TblCustomers086
    template_name = 'customers/list.html'
    context_object_name = 'customers'

class CustomerCreateView(CreateView):
    model = TblCustomers086
    form_class = CustomerForm
    template_name = 'customers/form.html'
    success_url = reverse_lazy('customer_list')

class CustomerUpdateView(UpdateView):
    model = TblCustomers086
    form_class = CustomerForm
    template_name = 'customers/form.html'
    success_url = reverse_lazy('customer_list')

class CustomerDeleteView(DeleteView):
    model = TblCustomers086
    template_name = 'customers/confirm_delete.html'
    success_url = reverse_lazy('customer_list')
def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.is_customer = True
            user.save()
            return redirect('login')
    else:
        form = RegisterForm()
    return render(request, 'register.html', {'form': form})

def user_login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('dashboard')
            else:
                form.add_error(None, "Invalid credentials")
    else:
        form = LoginForm()
    return render(request, 'login.html', {'form': form})

@login_required
def dashboard(request):
    if request.user.is_admin:
        return render(request, 'admin_dashboard.html')
    else:
        customer = TblCustomers086.objects.get(email=request.user.email)
        accounts = TblAccountDetails086.objects.filter(customer=customer)
        transactions = TblTransactions086.objects.filter(tst_account_number__in=accounts)
        return render(request, 'customer_dashboard.html', {'accounts': accounts, 'transactions': transactions})