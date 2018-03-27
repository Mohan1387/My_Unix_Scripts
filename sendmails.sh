#!/bin/bash
# Sending mail to remote user

sender="hduser@meysochdmn01.localdomain"
receiver="MohanKumar.Manivannan@du.ae"
body="THIS IS THE BODY"
subj="THIS IS THE SUBJECT"


echo $body | mail $receiver -s "THIS IS THE SUBJECT full"
echo $body | mail $receiver -s "$subj" 
