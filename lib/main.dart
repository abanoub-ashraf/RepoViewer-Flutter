import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/presentation/app_widget.dart';

///
/// Domain Driven DEsign:
/// ======================
/// - every feature in the app is divided into 4 layers.
/// 
///     1- Presentation Layer:
///     ========================
/// 
///         - the ui of the app like the widget and whatever the user can touch
/// 
///         - the application layer will send states to this layer
/// 
///         - this layer will receive the entity and the failure from the application layer 
///           in a form of a state and they need to be handled in here like build specific ui etc
/// 
///         - this layer will receive everything nicely represented in a union in a state form
///           and that union will contain initial state, loading state, loaded state which will 
///           contain the entities and then it will contain a failure state that will contain
///           the failures
/// 
///         - some other states will be delivered to this layer as well like the loading state
///           to show a loading indicator in the ui cause we dealing with asynchronous code
/// 
///     2- Application Layer:
///     =======================
/// 
///         - the state management of the entire app lives in this layer
/// 
///         - this layer gives the state to the presentation layer through its methods
/// 
///         - we will generate data classes and unions for the state classes in this layer
/// 
///         - the presentation layer sends raw data to the states of this layer like the string
///           inside some input to get specific data state based on that input etc
/// 
///         - the code for making that data that will be passed from this layer to the presentation 
///           wont be in this layer, it will be in the infrastructure layer and it will be sent
///           to this layer through the entities of the domain layer
/// 
///         - this layer will communicate with the infrastructure layer through entities which
///           represents the domain layer
/// 
///         - this layer is like a high way which can deliver things though out our whole app
/// 
///         - this layer can be called and used by the presentation layer and also by the 
///           infrastructure layer, it will trigger some actions in the app, something will change
///           and that change will be in a form of a state that will be sent to the presentation
/// 
///         - this layer outputs its state only to the presentation layer
/// 
///         - the state will receive either the entity or the failure coming from the repositories
///           of the infrastructure through the either type as a regular return type of a method
/// 
///         - this layer will receive the entity and the failure coming from the infrastructure's
///           repository then to the domain then to itself and will put them both individually 
///           into a state union
/// 
///         - this layer also contains the logic of the app
/// 
///         - this layer transform the infra structure data into a form that the presentation
///           layer can understand that that form is a state
/// 
///     3- Domain Layer:
///     ==================
/// 
///         - its entities is the connection between the infrastructure layer and the application one
/// 
///         - it will take the data from the infrastructure layer and give them to the states
///           in the application layer then the application layer will send the state to the presentation
/// 
///         - entities are some data classes that doesn't contain any specific flutter code
/// 
///         - entities contain validated value objects (these hold logic)
/// 
///         - entities are clean dart data classes using freezed package
/// 
///         - the entities of this domain layer and the failures that will come from the infrastructure
///           one will be put into an either type when they travel between the infrastructure's repository
///           and the state of the application layer then the application layer will put the entity
///           and the failure individually into a state and give them to the presentation
/// 
///         - they are data classes which represent the data in a way which our app can easily
///           work with
/// 
///         - they will have only data and possibly some business logic methods or properties on them
/// 
///         - they don't care about transforming data from json into dart classes, that will be 
///           the responsibility of a data transfer object (DTO) which is going to care about
///           json and how to convert them into dart data
/// 
///     4- Infrastructure Layer:
///     ==========================
/// 
///         - once the entities of the domain layer arrives to this layer, the repositories of 
///           this layer will talk to the external resources like a remote server or 
///           the local service bring data from it and give it to the entities of the domain layer
/// 
///         - the connection between the remote server and the repository is the data transfer objects
/// 
///         - the remote service might send exceptions to the repository when the repository is
///           talking to it for getting data from it
/// 
///         - the repositories might send failures to the entities of the domain layer
/// 
///         - sometimes the local/remote services will be able to talk to the state of the application 
///           layer sending only raw data and then the state of the application layer will trigger 
///           something to happen in the app
/// 
///         - the remote/local services talks to the api/db through raw data
/// 
///         - data transfer objects are in the middle between the repositories and the remote/local 
///           services and they copy the entities of the domain layer
/// 
///         - data transfer objects can be messy, they can have some coe for converting between
///           json and the class like fromJson and toJson methods
/// 
///         - dto is not a pure class like an entity of the domain layer
/// 
///         - dto will arrive to the repository and from there is should be converted into an entity
/// 
///         - exceptions exist inside this layer, they can be thrown when the remote/local service
///           is giving data to the repository, they have their own flow, they need try catch blocks
/// 
///         - we wil only deal with exceptions inside this layer only, in the repositories
/// 
///         - once we get out of this layer going to the other layers we wanna have zero exceptions
///           and that's why we will transform them into failures using the either type, we will use 
///           entities and failures inside either type through the either union and they both will
///           be carried from the infrastructure to the state of the application through the 
///           repositories of the infrastructure
/// 
///         - failures are gonna be freezed unions, either type is union as well so they can 
///           work together just fine
/// 
///         - the responsibility of a data transfer object (DTO) is to care about json and how to 
///           convert them into dart data then that data will be sent to the repository to be 
///           converted in there into entity/failure
/// 
///         - the repository will convert the dto into entity, it takes a dto and output
///           entity/failure
/// 
///         - the dto will take the raw json data from the api and convert it into dart class,
///           that class is sorta messy and then it will be converted into entity by the repository
///           which will have the conversion method
///
void main() => runApp(
    ///
    /// - the top level widget in the app must be wrapped in the provider scope widget
    ///   when we using riverpod
    /// 
    /// - ProviderScope is a widget that stores the state of providers
    /// 
    /// - all flutter applications using Riverpod must contain a [ProviderScope] at the root of their widget tree
    ///
    ProviderScope(
        child: AppWidget()
    )
);