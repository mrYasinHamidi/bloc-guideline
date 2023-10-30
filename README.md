# State Management (Bloc)

We have three main parameters in Bloc:

* Bloc class
* State class
* Event Class

Next, I want to talk about the rules and principles. Our goal is to use Bloc State Management in a uniform and integrated way within our team.


### Event creation
For each task that the bloc is going to perform, we should have one specific Event.

### State creation
We create our States using the Multi-State approach. This means that we can have multiple State classes for one Bloc.

Consider the following points when creating your States:

* Have one parent class and multiple subclasses.
* All of your states should extend from the parent class.
* The parent class should be a Sealed class.
* Your State represents your data, and you should not hold any data inside the Bloc.





### Parent state
Our parent state is a sealed class and so we can not create any instance from it. Instead, we create some other subclasses from it and use them. Inside this parent class, we set variables that we want to hold across the bloc lifecycle.
The parent state should extend from Equatable.

### Sub States
Sub-states contain data that we don't want to persist across the entire Bloc lifecycle. This data will only remain within the lifecycle of the State. This means that when a new state is emitted, the previous state and its data will be lost.
Note that add properties to the prop list of equitable in all Sub-States




# Naming Conventions

### Event Conventions
Events should be named in the past tense because events are things that have already occurred from the bloc's perspective.

Anatomy :  `Bloc Subject + Noun (Optional) + verb (event)`  
Initial load events should follow the convention: `Bloc Subject + Started`

#### Good
```
sealed class CounterEvent {}
final class CounterStarted extends CounterEvent {}
final class CounterIncrementPressed extends CounterEvent {}
final class CounterDecrementPressed extends CounterEvent {}
final class CounterIncrementRetried extends CounterEvent {}
```
#### Bad
```
sealed class CounterEvent {}
final class Initial extends CounterEvent {}
final class CounterInitialized extends CounterEvent {}
final class Increment extends CounterEvent {}
final class DoIncrement extends CounterEvent {}
final class IncrementCounter extends CounterEvent {}

```
### State Conventions

Anatomy : `Bloc Subject + Verb (action) + State`  
Initial State follows  the convention: `Bloc Subject + Initial`

#### Good
```
sealed class CounterState {}
final class CounterInitial extends CounterState {}
final class CounterLoadInProgress extends CounterState {}
final class CounterLoadSuccess extends CounterState {}
final class CounterLoadFailure extends CounterState {}
```

#### Bad
```
sealed class CounterState {}
final class Initial extends CounterState {}
final class Loading extends CounterState {}
final class Success extends CounterState {}
final class Succeeded extends CounterState {}
final class Loaded extends CounterState {}
final class Failure extends CounterState {}
final class Failed extends CounterState {}

```
