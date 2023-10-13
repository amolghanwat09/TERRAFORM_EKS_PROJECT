region = "us-east-1"
access_key = ""
secret_key = ""

vpc_config= {

    vpc01={
        vpc_cidr_block = "192.168.0.0/16"

        tags = {

            "Name" = "my_vpc"
        }
    }
}

subnet_config = {

    "public-us-east-1a" = {

     vpc_name = "vpc01"   

     cidr_block = "192.168.0.0/18"

     availability_zone = "us-east-1a"

     tags = {

        "Name" = "public-us-east-1a"

     }
        
    }

     "public-us-east-1b" = {

    vpc_name = "vpc01"

     cidr_block = "192.168.64.0/18"

     availability_zone = "us-east-1b"

     tags = {

        "Name" = "public-us-east-1b"

     }
        
    }

     "private-us-east-1a" = {

     vpc_name = "vpc01"

     cidr_block = "192.168.128.0/18"

     availability_zone = "us-east-1a"

     tags = {

        "Name" = "private-us-east-1a"

     }
        
    }

    "private-us-east-1b" = {


    vpc_name = "vpc01"

     cidr_block = "192.168.192.0/18"

     availability_zone = "us-east-1b"

     tags = {

        "Name" = "private-us-east-1b"

     }
        
    }
}



internet_GW_config = {

    igw01 = {

        vpc_name = "vpc01"

        tags = {
            "Name" = "My_IGW"
        }
    }

}







elastic_IP_config = {

    eip01 = {
        tags = {

            "Name" = "nat02"
        }
    }

    eip02 = {
        tags = {

            "Name" = "nat01"
        }
    }

}

nat_GW_config = {

    natgw01 = {

        eip_name = "eip01"
        subnet_name = "public-us-east-1a"

        tags= {

            "Name" = "natgw01"
        }


    }

     natgw02 = {

        eip_name = "eip02"
        subnet_name = "public-us-east-1b"

        tags = {

            "Name" = "natgw02"
        }
    }

}

aws_route_table_config = {

    RT01 = {

        private = 0

        vpc_name = "vpc01"
        gateway_name = "igw01"
        tags = {

            "Name" = "Public_Route"
        }


    }

    RT02 = {

        private = 1
        vpc_name = "vpc01"
        gateway_name = "natgw01"
        tags = {

            "Name" = "Private_Route"
        }

        
    }

    RT03 = {

        private = 1


        vpc_name = "vpc01"
        gateway_name = "natgw02"
        tags = {

            "Name" = "Private_Route"
        }
        
    }


}

aws_route_table_association_config = {

    RT01Assoc = {

        subnet_name = "public-us-east-1a"

        route_table_name = "RT01"

    }

     RT02Assoc = {

        subnet_name = "public-us-east-1a"

        route_table_name = "RT01"
        
    }

     RT03Assoc = {

        subnet_name = "public-us-east-1a"

        route_table_name = "RT02"
        
    }

     RT04Assoc = {

        subnet_name = "public-us-east-1a"

        route_table_name = "RT03"
        
    }


}
