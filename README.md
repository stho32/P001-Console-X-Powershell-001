# A random stuff generator

This powershell script helps you generate:
- random numbers
- random passwords
- and random animal names

This project has been implemented fulfilling these [Documentation](Documentation\Requirements.md).

## Usage

### Grab a random number between 1 and 10

```
.\random.ps1
```

example output: `4`

### Grab a random number between a minimum and a maximum

```
.\random.ps1 -Min 1 -Max 100
```

example output: `12`


### Grab a random password

#### default
```
.\random.ps1 password
```

example output: `8B§G1z[]I5`

#### custom length

```
.\random.ps1 password -PasswordLength 20
```
example output: `PT%Wk"JxwEOQ§n3P2dH4`

#### control the number of special chars and digits

```
.\random.ps1 password -SpecialCharsCount 4 -Digits 2
```
example output: `{![h74X]6N`

#### all customizations together

```
.\random.ps1 password -PasswordLength 15 -SpecialCharsCount 4 -Digits 2
```
example output: `j1{&jsP53uXhw][`

### grab a random animal name

```
.\random.ps1 animal
```
example output: `strangly-running-elephant`