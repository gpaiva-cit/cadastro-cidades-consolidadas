insert = (
    "INSERT INTO ECONOMIA ("
        "fk_cidade, "
        "numero_shoppings, "
        "numero_shoppings_com_centauro, "
        "presenca_centauro_shoppings_cidade, "
        "presenca_magalu, "
        "presenca_americanas, "
        "taxa_delivery_online"
    ") VALUES ("
        "%(cidade_uf)s, "
        "%(numero_shoppings)s, "
        "%(numero_shoppings_com_centauro)s, "
        "%(presenca_centauro_shoppings_cidade)s, "
        "%(presenca_magalu)s, "
        "%(presenca_americanas)s, "
        "%(taxa_delivery_online)s"
    ");"
)