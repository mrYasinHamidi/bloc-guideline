# State Management (BloC)

We have three main parameters in our BloC:

* Bloc Class
* State Class
* Event Class

>This repository includes example code that incorporates all the following notes. After reading this introduction, please examine the code. 

I want to talk about the rules and principles. Our goal is to use Bloc State Management in a uniform and integrated way within our team.


### Event Creation
For each task that the bloc is going to perform, we should have one specific Event.

### State Creation
We employ the Multi-State approach to create our states, allowing us to have multiple state classes for a single bloc.

Consider the following points when creating your States:

* Have one parent class and multiple subclasses.
* Ensure all states extend from the parent class, which should be sealed.
* Remember, your state is responsible for representing your data; avoid holding any data inside the Bloc.





### Parent State
Our parent state is a sealed class, meaning no instances can be created from it. Instead, we create subclasses from it and use them. Inside this parent class, we define variables that we want to hold across the bloc lifecycle.
The parent state should extend from Equatable.

### Sub States
Sub-states contain data that we don't want to persist across the entire Bloc lifecycle. This data will only remain within the lifecycle of the State. This means that when a new state is emitted, the previous state and its data will be lost.
Ensure that properties are added to the prop list of Equatable for all Sub-States.




# Naming Conventions

### Event Conventions
Events should be named in the past tense because events represent actions that have already occurred from the bloc's perspective.

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
