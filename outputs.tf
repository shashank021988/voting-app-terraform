# Root outputs.tf (Main folder mein)

# output "voting_app_url" {
# description = "The URL of the voting application"
# syntax: module.<module_name>.<output_variable_name>
# value = "http://localhost:31000" 
#}

output "voting_app_url" {
  # Ye command automatic Minikube ka IP uthayegi agar aapne kubernetes provider set kiya hai
  value = "Check your Minikube IP using 'minikube ip' and port 31000"
}



#output "result_app_url" {
  # Ye command automatic Minikube ka IP uthayegi agar aapne kubernetes provider set kiya hai
 # value = "Check your Minikube IP using 'minikube ip' and port 31000"
#}

#output "result_app_url" {
 # description = "The URL of the result application"
  #value = "http://localhost:31001"
#}

