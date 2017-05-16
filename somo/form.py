from django import forms
from django.contrib.auth.models import User

from somo.models import Book


class RegisterForm(forms.Form):
    firstname = forms.CharField(label='Firstname',max_length=80,
                                widget=forms.TextInput(
                                    attrs={
                                        'class':'form-control'
                                    }
                                ))
    lastname =forms.CharField(label='Lastname',max_length=80,
                              widget=forms.TextInput(
                                  attrs={
                                      'class':'form-control'
                                  }
                              ))
    username = forms.CharField(label='Username', max_length=80,
                               widget=forms.TextInput(
                                   attrs={
                                       'class': 'form-control'
                                   }
                               ))
    email = forms.CharField(label='Email',max_length=80,
                            widget=forms.EmailInput(
                                attrs={
                                    'class':'form-control'
                                }
                            ))
    password = forms.CharField(label='Password',max_length=80,
                               widget=forms.PasswordInput(
                                   attrs={
                                       'class': 'form-control'
                                   }
                               ))
    confirm = forms.CharField(label='Confirm Password',max_length=80,
                              widget=forms.PasswordInput(
                                  attrs={
                                      'class':'form-control'
                                  }
                              ))


class LoginForm(forms.Form):
    model = User
    class Meta:
        fields = {
            'email',
            'password'
        }


class ProfileForm(forms.Form):
    mobile = forms.CharField(label='Mobile', max_length=13,
                             widget=forms.TextInput(
                                 attrs={
                                     'class': 'form-control'
                                 }
                             ))
    reg = forms.CharField(label='Reg Number', max_length=50,
                          widget=forms.TextInput(
                              attrs={
                                  'class': 'form-control'
                              }
                          ))
    firstname = forms.CharField(label='Firstname', max_length=80,
                                widget=forms.TextInput(
                                    attrs={
                                        'class': 'form-control',


                                    }
                                ))
    lastname = forms.CharField(label='Lastname', max_length=80,
                               widget=forms.TextInput(
                                   attrs={
                                       'class': 'form-control'
                                   }
                               ))


class PasswordForm(forms.Form):
    new_pass = forms.CharField(label='New Password',max_length=50,
                               widget=forms.PasswordInput(
                                   attrs={
                                       'class':'form-control'
                                   }
                               ))
    new_password = forms.CharField(label='Confirm Password',max_length=50,
                                   widget=forms.PasswordInput(
                                       attrs={
                                           'class':'form-control'
                                       }
                                   ))


class UploadForm(forms.ModelForm):
    class Meta:
        model=Book
        fields = (
            'title',
            'description',
            'year',
            'semester',

            'document',

        )
