![license: MIT/Apache-2.0](https://img.shields.io/badge/license-MIT%2FApache--2.0-blue.svg)
[![crates.io](https://img.shields.io/crates/v/{{ project-name }})](https://crates.io/crates/{{ project-name }})
[![documentation](https://docs.rs/{{ project-name }}/badge.svg)](https://docs.rs/{{ project-name }})

![rust: 1.85+](https://img.shields.io/badge/rust-1.85+-orange.svg)
![`unsafe`: forbidden](https://img.shields.io/badge/unsafe-forbidden-success.svg)

[![codecov](https://codecov.io/gh/DuskSystems/{{ project-name }}/graph/badge.svg)](https://codecov.io/gh/DuskSystems/{{ project-name }})
[![codspeed](https://img.shields.io/endpoint?url=https://codspeed.io/badge.json)](https://codspeed.io/DuskSystems/{{ project-name }})

# `{{ project-name }}`

{{ description }}

## Usage

```bash
> cargo generate \
  --git https://github.com/DuskSystems/template.git \
  --name {{ project-name }} \
  --define description="{{ description }}" \
  --define keywords='{{ keywords }}' \
  --define categories='{{ categories }}'
> cd {{ project-name }}
> git add .
> git commit -m "feat: initial commit"
> ./scripts/setup.sh
```

### Cleanup

Delete this section from the README, and `scripts/setup.sh`.

## License

`{{ project-name }}` is licensed under the terms of both the [MIT License](LICENSE-MIT) and the [Apache License (Version 2.0)](LICENSE-APACHE).
