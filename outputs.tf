# this file would contain what the module returns 
output "instance_name" {
    value="${google_compute_instance.default.name}"
}