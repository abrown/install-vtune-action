install-vtune-action
====================

Install VTune as a step in a GitHub workflow.

### Use

```
  steps:
    - uses: abrown/install-vtune-action
    - run: vtune -collect hotspots ...
```

Use the `vtune` command as you would locally ([docs]); note, however, that GitHub runner
environments are highly limited and certain knobs are not available.

[docs]: https://www.intel.com/content/www/us/en/docs/vtune-profiler/get-started-guide/2023/linux-os.html

### Parameters

| Input     | Default  | Description                                              |
|-----------|----------|----------------------------------------------------------|
| `env`     | true     | Run the VTune setup script to configure the environment. |
