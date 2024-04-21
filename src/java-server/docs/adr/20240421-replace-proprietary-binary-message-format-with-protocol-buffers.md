# Replace Proprietary Binary Message Format with Protocol Buffers

- Status: [draft | proposed | rejected | accepted | deprecated | … | superseded by [xxx](yyyymmdd-xxx.md)] <!-- optional -->
- Date: 2024-04-22
- Tags: architecture, protobuf

Technical Story: [description | ticket/issue URL] <!-- optional -->

## Context and Problem Statement

Our server and client components currently utilize a proprietary binary message format for data serialization and communication. This format has been difficult to maintain and extend. Additionally, the proprietary format lacks support for generating language-specific bindings, making it difficult to integrate with systems developed using different programming languages.

## Decision Drivers <!-- optional -->

- extensibility of message contents
- bindings generated for various languages (in the future, we might decide to reimplement the Java client component in JavaScript or TypeScript)
- efficiency of (de)serialization

## Considered Options

- Protocol Buffers
- JSON or XML
- MessagePack
- …

## Decision Outcome

Chosen option: "Protocol Buffers", because it comes out best (see below).

Messages in the old format will be embedded within the new messages.

### Positive Consequences <!-- optional -->

- improved interoperability, maintainability, and performance
- …

### Negative Consequences <!-- optional -->

- Additional tooling
- Migration Effort: Migrating from our proprietary binary format to Protocol Buffers will require effort and coordination across development teams. We will need to update existing codebases, redefine message schemas, and refactor communication protocols to use protobuf serialization.
- Both formats will supported during a (potentially long) transition period

### Confirmation <!-- optional -->

{Describe how the implementation of/compliance with the ADR is confirmed. E.g., by a review or an ArchUnit test.
 Although we classify this element as optional, it is included in most ADRs.}

## Pros and Cons of the Options <!-- optional -->

### Protocol Buffers

[example | description | pointer to more information | …] <!-- optional -->

- Good, because it enables both backward and forward compatibility.
- Good, because messages in the old format can be embedded within the new messages, allowing for almost effortless backward compatibility.
- Bad, because [argument c]
- … <!-- numbers of pros and cons can vary -->

### JSON or XML

[example | description | pointer to more information | …] <!-- optional -->

- Good, because these formats are commonly used, and are human-readable.
- Bad, because a lot of boilerplate code still needs to be implemented even when libraries and schemas are adopted.
- Bad, because parsing data in these formats is relatively inefficient, and the serialized output is unnecessarily large.

### [option 3]

[example | description | pointer to more information | …] <!-- optional -->

- Good, because [argument a]
- Good, because [argument b]
- Bad, because [argument c]
- … <!-- numbers of pros and cons can vary -->

## More information <!-- optional -->

The proprietary format continues to be used on the backend.
Also, copies of messages in the old proprietary format are embedded within the new messages. The structure of these embedded messages must not change anymore even though the format used on the backend gets updated.

- [Link type](link to adr) <!-- example: Refined by [xxx](yyyymmdd-xxx.md) -->
- … <!-- numbers of links can vary -->
