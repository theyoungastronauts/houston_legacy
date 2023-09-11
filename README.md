# Houston
## A flutter meta-framework

## EARLY PREVIEW
This is an early preview of this framework.

### Overview

Houston is a flutter meta-framework for scaffolding applications quickly. It uses a few levels of code generation to create a delightful developer experience. Currently, Houston is built to work with Supabase as its backend, however it is being designed in a way to support a backend-agnostic workflow.

### Libraries
```
State Management: flutter_riverpod
Routing: go_router
Networking: dio
Backend: supabase
```

### Getting Started
1. Create a [supabase](https://supabase.com) account 
2. Update assets/env/develop_env with the correct project / public key
3. Run the SQL table generation 
    - profile required
    - album/food/etc => only if you want to use those features
4. Execute the `cli/database/user_create.plpgsql` file => this will automatically create a trigger that fires when a new user is created to create a profile for them.
5. in the root directory, run `make init`. If you don't have make on your machine, just run the commands listed in there. This will simply run all the `flutter/dart pub get` functions.
6. Launch the app!

### Generating Code
Using the cli, you run the command `new` and type in the name of the model you want to create. This will create a .yaml file where you can add the fields your model will include.

Next, run the command `scaffold` in the cli and Houston will generate the boilerplate code for that feature, create the neccissary imports, and then invoke the build runner to initialize the auto generated code. Phew!

There are a few supported types but this isn't very well documented yet. See the existing blueprints for an example or dig into the cli code!
