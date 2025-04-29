resource "aws_instance" "test" {
    ami =  var.image_id
    instance_type = "t2.micro"  
    tags = {
        Name = "test"
    }
  
}
