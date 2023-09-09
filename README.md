# Houston
## A flutter meta-framework

## EARLY PREVIEW
This is an early preview of this framework.

### Overview

Houston is a flutter meta-framework for scaffolding applications quickly. It uses a few levels of code generation to create a delightful developer experience. Currently, Houston is built to work with Supabase as its backend, however it is being designed in a way to support a backend-agnostic workflow.

### Libraries
State Management: flutter_riverpod
Routing: auto_route
Networking: dio
Backend: supabase
Singletons: get_it


### Generating Code
Using the cli, you run the command `new` and type in the name of the model you want to create. This will create a .yaml file where you can add the fields your model will include.

Next, run the command `scaffold` in the cli and Houston will generate the boilerplate code for that feature, create the neccissary imports, and then invoke the build runner to initialize the auto generated code. Phew!

### Features


