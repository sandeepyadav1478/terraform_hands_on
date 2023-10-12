# Start a container
resource "docker_container" "ubuntu" {
  name  = "test-docker"
  image = docker_image.ubuntu.image_id
  must_run = true
  publish_all_ports = true
  command = [
    "tail",
    "-f",
    "/dev/null"
  ]
}

# Find the latest Ubuntu precise image.
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

# # Create a EC2
# resource "aws_instance" "example" {
#   provider = aws.prod
#   ami = "ami-05552d2dcf89c9b24"
#   instance_type = "t2.micro"
# }