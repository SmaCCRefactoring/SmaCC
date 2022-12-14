"
I record resources to be used to test the Cucumber parser
"
Class {
	#name : #CucumberParserTests,
	#superclass : #TestCase,
	#category : 'SmaCC-Cucumber'
}

{ #category : #resources }
CucumberParserTests class >> backgroundFeature [
	"From Gherkin3 test data"

	^ 'Feature: Background

  Background: a simple background
    Given the minimalism inside a background


  Scenario: minimalistic
    Given the minimalism'
]

{ #category : #resources }
CucumberParserTests class >> datatablesFeature [
	"From Gherkin3 test data"

	^ 'Feature: DataTables

  Scenario: minimalistic
    Given a simple data table
      | foo | bar |
      | boz | boo |
    And a data table with a single cell
      | foo |
    And a data table with different fromatting
      |   foo|bar|    boz    |    
    And a data table with an empty cell
      |foo||boz|
    And a data table with comments and newlines inside
      | foo | bar |

      | boz  | boo  |
      # this is a comment
      | boz2 | boo2 |'
]

{ #category : #resources }
CucumberParserTests class >> descriptionFeature [
	"From Gherkin3 test data"

	^ 'Feature: Descriptions everywhere
  This is a single line description

  Scenario: two lines
  This description
  has two lines and indented with two spaces
    Given the minimalism

Scenario: without indentation
This is a description without indentation
  Given the minimalism

  Scenario: empty lines in the middle
  This description

  has an empty line in the middle
    Given the minimalism

  Scenario: empty lines around

  This description
  has an empty lines around

    Given the minimalism

  Scenario: comment after description
  This description
  has a comment after

# this is a comment
    Given the minimalism

  Scenario: comment right after description
  This description
  has a comment right after
    #  this is another comment

    Given the minimalism

  Scenario Outline: scenario outline with a description
This is a scenario outline description
    Given the minimalism

  Examples: examples with description
This is an examples description
    | foo |
    | bar |'
]

{ #category : #resources }
CucumberParserTests class >> docstringFeature [
	"From Gherkin3 test data"

	^ 'Feature: DocString variations

  Scenario: minimalistic
    Given a simple DocString
      """
      first line (no indent)
        second line (indented with two spaces)
      third line was empty
      """
    Given a DocString with content type
      """xml
      <foo>
        <bar />
      </foo>
      """
    And a DocString with wrong indentation
      """
    wrongly indented line
      """
    And a DocString with alternative separator
      ```
      first line
      second line
      ```
    And a DocString with normal separator inside
      ```
      first line
      """
      third line
      ```
    And a DocString with alternative separator inside
      """
      first line
      ```
      third line
      """'
]

{ #category : #resources }
CucumberParserTests class >> exampleTokensEverywhereFeature [
	"From Gherkin3 test data"

	^ 'Feature: Example tokens everywhere

  Scenario Outline: the <one>
    Given the <two>:
      """
      <three>
      """
    Given the <four>:
      | <five> |

    Examples:
      | one | two  | three | four   | five  |
      | un  | deux | trois | quatre | cinq  |
      | uno | dos  | tres  | quatro | cinco |'
]

{ #category : #resources }
CucumberParserTests class >> languageFeature [
	"From Gherkin3 test data"

	^ '#language:en

Feature: Explicit language specification

  Scenario: minimalistic
    Given the minimalism'
]

{ #category : #resources }
CucumberParserTests class >> minimalFeature [
	"From Gherkin3 test data"

	^ 'Feature: Minimal

  Scenario: minimalistic
    Given the minimalism'
]

{ #category : #resources }
CucumberParserTests class >> scenarioOutlineFeature [
	"From Gherkin3 test data"

	^ 'Feature: Minimal Scenario Outline

Scenario Outline: minimalistic
    Given the <what>

Examples:
  | what       |
  | minimalism |'
]

{ #category : #resources }
CucumberParserTests class >> severalExamplesFeature [
	"From Gherkin3 test data"

	^ 'Feature: Tagged Examples

  Scenario Outline: minimalistic
    Given the <what>

    @foo
    Examples:
      | what |
      | foo  |

    @bar
    Examples:
      | what |
      | bar  |

  @zap
  Scenario: ha ok'
]

{ #category : #resources }
CucumberParserTests class >> tagsFeature [
	"From Gherkin3 test data"

	^ '@feature_tag1 @feature_tag2
  @feature_tag3
Feature: Minimal Scenario Outline

@scenario_tag1 @scenario_tag2
  @scenario_tag3
Scenario: minimalistic
    Given the minimalism

@so_tag1  @so_tag2  
  @so_tag3
Scenario Outline: minimalistic outline
    Given the <what>

@ex_tag1 @ex_tag2
  @ex_tag3
Examples: 
  | what       |
  | minimalism |'
]

{ #category : #tests }
CucumberParserTests >> testBackgroundFeature [
	CucumberParser parse: self class backgroundFeature
]

{ #category : #tests }
CucumberParserTests >> testDatatablesFeature [
	CucumberParser parse: self class datatablesFeature
]

{ #category : #tests }
CucumberParserTests >> testDescriptionFeature [
	CucumberParser parse: self class descriptionFeature
]

{ #category : #tests }
CucumberParserTests >> testDocstringFeature [
	CucumberParser parse: self class docstringFeature
]

{ #category : #tests }
CucumberParserTests >> testExampleTokensEverywhereFeature [
	CucumberParser parse: self class exampleTokensEverywhereFeature
]

{ #category : #tests }
CucumberParserTests >> testLanguageFeature [
	CucumberParser parse: self class languageFeature
]

{ #category : #tests }
CucumberParserTests >> testMinimalFeature [
	CucumberParser parse: self class minimalFeature
]

{ #category : #tests }
CucumberParserTests >> testScenarioOutlineFeature [
	CucumberParser parse: self class scenarioOutlineFeature
]

{ #category : #tests }
CucumberParserTests >> testSeveralExamplesFeature [
	CucumberParser parse: self class severalExamplesFeature
]

{ #category : #tests }
CucumberParserTests >> testTagsFeature [
	CucumberParser parse: self class tagsFeature
]
