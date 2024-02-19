# Most Popular Articles de The New York Times

Este proyecto es una aplicacion que consume la API creada en [Most Popular Articles API](https://developer.nytimes.com/docs/most-popular-product/1/overview)  y muestra una lista de Articulos mas populares del New York Times mediante un TableView. Cuándo es seleccionando un articulo de la lista, se muestra un detalle con más información sobre el articulo.


## Requisitos de ejecucion

-   Xcode 14.1 or later
-   iOS 14.0 or later
-   OS X v13.3.1 
-   Apple Swift Packages

## Proyecto

Arquitectura y librerias que se utilizaron:

- Swift
- UIKit
- VIPER
- XCTest
- Foundation
  
## JSON 
Response para consumir el REST/JSON

    {
    "status": "OK",
    "copyright": "Copyright (c) 2024 The New York Times Company.  All Rights Reserved.",
    "num_results": 20,
    "results": [
        {
            "uri": "uri",
            "url": "url",
            "id": 000000000000,
            "asset_id": 000000000000,
            "source": "New York Times",
            "published_date": "2024-02-19",
            "updated": "2024-02-15 00:00:00",
            "section": "Opinion",
            "subsection": "",
            "nytdsection": "opinion",
            "adx_keywords": "",
            "column": null,
            "byline": "By The New York Times",
            "type": "Article",
            "title": "Title",
            "abstract": "description",
            "des_facet": [
                "Memory",
                "Presidential Election of 2024",
                "Age, Chronological",
                "Brain",
                "Elderly"
            ],
            "org_facet": [],
            "per_facet": [
                "Biden, Joseph R Jr",
                "Trump, Donald J"
            ],
            "geo_facet": [],
            "media": [
                {
                    "type": "image",
                    "subtype": "photo",
                    "caption": "",
                    "copyright": "The New York Times",
                    "approved_for_syndication": 1,
                    "media-metadata": [
                        {
                            "url": "url_image",
                            "format": "Standard Thumbnail",
                            "height": 75,
                            "width": 75
                        },
                        {
                            "url": "url_image",
                            "format": "mediumThreeByTwo210",
                            "height": 140,
                            "width": 210
                        },
                        {
                            "url": "url_image",
                            "format": "mediumThreeByTwo440",
                            "height": 293,
                            "width": 440
                        }
                    ]
                }
            ],
            "eta_id": 0
        }
      ]
    }
