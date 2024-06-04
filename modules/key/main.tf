resource "aws_key_pair" "ToDo-App" {
    key_name = "Botgauge-key"
    public_key = file("../modules/key/Botgauge-key.pub")
}