workspace {

    !identifiers hierarchical

    model {
        customer = person "Customer"

        orderService = softwareSystem "Order Service"
        invoiceService = softwareSystem "Invoice Service"
        customerService = softwareSystem "Customer Service"
    }

    views {
        properties {
            # plantuml.title: true (default) to include diagram titles, false to exclude diagram titles.
            plantuml.title true

            # plantuml.includes: a comma separated list of file names that should be included (via !include) in the diagram definition.
            plantuml.includes includes/c4puml.puml

            # plantuml.sequenceDiagram: true to generate a UML sequence diagram, false (default) to generate a collaboration diagram (dynamic views only).
            plantuml.sequenceDiagram false

            # plantuml.animation: true to generate one PlantUML diagram definition per animation frame, false (default) to ignore animations.
            plantuml.animation false

            # c4plantuml.tags: true to generate diagram definitions based upon how the Structurizr diagram renderer creates diagrams using tags and styles, false (default) to generate diagram definitions that use the default C4-PlantUML styling (i.e. blue and grey boxes). Please note that with this property set to true, this exporter does not follow the approach that C4-PlantUML uses for tags and styling. If you would like this behaviour instead of what is provided here, you may want to take a look at https://github.com/cloudflightio/structurizr-export-c4plantuml instead.
            c4plantuml.tags true

            # c4plantuml.legend: true (default) to include the diagram legend, false to exclude the legend.
            c4plantuml.legend true

            # c4plantuml.stereotypes: true to include stereotypes, false (default) to exclude stereotypes.
            c4plantuml.stereotypes false

            # c4plantuml.elementProperties: true to include element properties, false (default) to exclude element properties.
            c4plantuml.elementProperties false

            # c4plantuml.relationshipProperties: true to include relationship properties, false (default) to exclude relationship properties.
            c4plantuml.relationshipProperties false

            # c4plantuml.stdlib: true (default) to use the built-in C4-PlantUML standard library, false to use the latest version from GitHub.
            c4plantuml.stdlib true
        }

        styles {
            element "Person" {
                shape person
                properties {
                    c4plantuml.sprite "user"
                }
            }
            element "Software System" {
                shape component
            }
            element "Container" {
                shape component
                properties {
                    c4plantuml.sprite "vscode"
                }
            }
            element "Component" {
                shape component
            }
        }
    }
        
}