mudule "qa" {
    source = "../../modules/web"

    environment = {
        name = "prd"
        network_prefix = "10.2"
    }

    min_size = 5
    max_size = 10
}