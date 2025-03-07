from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    phone = models.CharField(max_length=20, unique=True, blank=True, null=True)
    is_customer = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)

    def __str__(self):
        return self.username


class TblCustomers086(models.Model):
    customer_id = models.AutoField(primary_key=True)
    full_name = models.CharField(max_length=100)
    dob = models.DateField()
    gender = models.CharField(max_length=10, blank=True, null=True)
    nationality = models.CharField(max_length=30, blank=True, null=True)
    email = models.EmailField(unique=True)
    phone = models.CharField(unique=True, max_length=20)
    address = models.TextField(blank=True, null=True)
    created_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'tbl_customers_086'


class TblAccountDetails086(models.Model):
    account_number = models.AutoField(primary_key=True)
    customer = models.ForeignKey(TblCustomers086, on_delete=models.CASCADE)
    account_type = models.CharField(max_length=20, blank=True, null=True)
    balance = models.DecimalField(max_digits=15, decimal_places=2)
    status = models.CharField(max_length=20, blank=True, null=True)
    account_pin = models.IntegerField(unique=True)
    created_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'tbl_account_details_086'


class TblTransactions086(models.Model):
    tst_transaction_id = models.AutoField(primary_key=True)
    tst_account_number = models.ForeignKey(TblAccountDetails086, on_delete=models.CASCADE)
    tst_amount = models.DecimalField(max_digits=15, decimal_places=2)
    tst_transaction_type = models.CharField(max_length=20, blank=True, null=True)
    tst_created_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'tbl_transactions_086'
