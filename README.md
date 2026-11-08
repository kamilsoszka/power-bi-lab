# Power BI Lab: Advanced DAX and Dynamic SVG Visualizations

[![Power BI](https://img.shields.io/badge/Power_BI-Developer_Mode_(PBIP)-F2C811?logo=powerbi&logoColor=black)](#)
[![DAX](https://img.shields.io/badge/DAX-SVG_Data_URIs-blue)](#)
[![Architecture](https://img.shields.io/badge/Architecture-TMDL_Semantic_Model-green)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Power BI portfolio lab featuring custom visualizations generated in DAX as SVG data URIs, automated Europe/Warsaw CET/CEST conversion, coordinated light and dark themes, and source-controlled Power BI Project artifacts.

## Live interactive reports

| Report | Description | Live link |
| --- | --- | --- |
| **Professional Profile** | Self-contained CV visualization implemented with a minimal helper table and theme-specific DAX measures that generate SVG data URIs with an embedded Base64 JPEG. | [Open in Power BI](https://app.powerbi.com/view?r=eyJrIjoiYTJlZWUxYTUtOGQxNS00ODU3LWIxNjktYzIxMDY3ZGIwZWM5IiwidCI6Ijc2NGY3ZmY0LTY2OWQtNDAwYi1iMDY0LTM4NTAyNDAxMTNiYiIsImMiOjl9) |
| **Workday Monitor** | Dynamic workday tracker showing schedule status, elapsed and remaining time, progress, Europe/Warsaw time, and semantic-model refresh metadata. | [Open in Power BI](https://app.powerbi.com/view?r=eyJrIjoiMjU1NjRiMDktZDVkYS00MWU5LWJmZjYtNTRhM2EzNGUzMjJiIiwidCI6Ijc2NGY3ZmY0LTY2OWQtNDAwYi1iMDY0LTM4NTAyNDAxMTNiYiIsImMiOjl9) |

> [!WARNING]
> The links above use Power BI **Publish to web**. They require no authentication and must contain only information approved for unrestricted public disclosure. Do not use confidential, personal, customer, employer, or proprietary data in a report published this way.

## Project goals

This repository demonstrates:

- DAX-generated SVG interfaces without third-party custom visuals
- embedded image assets without external image hosting
- light and dark report variants with a shared layout
- semantic-model definitions stored in source control
- Power BI Project and TMDL-based development
- Microsoft Fabric workspace integration with GitHub
- Europe/Warsaw daylight-saving-time calculations
- desktop, service, browser, and mobile validation

## Technical highlights

### Pure DAX SVG generation

The report layouts, labels, badges, panels, photo frame, and dynamic values are produced by DAX measures. Each measure returns a Power BI-compatible `data:image/svg+xml;utf8,...` value and uses the `Image URL` data category.

### Self-contained Professional Profile

The Professional Profile uses:

- one disconnected helper table named `Professional Profile`
- one text column named `Placeholder`
- `Professional Profile SVG Light`
- `Professional Profile SVG Dark`
- an embedded Base64 JPEG stored inside each SVG measure

The helper table exists only to provide a home table for the measures. It contains no business data and has no model relationships.

### Europe/Warsaw time handling

The measures use `UTCNOW()` and calculate the final Sunday of March and October to select either:

- CET, UTC+1
- CEST, UTC+2

The displayed timestamp represents a DAX evaluation event. It is not a continuously running client-side clock.

### Theme variants

The light and dark measures use the same:

- SVG dimensions and `viewBox`
- layout coordinates
- content hierarchy
- experience calculations
- time-zone calculations
- embedded photograph

The color palettes differ by theme. Changes to content or layout should be applied consistently to both measures.

## Repository structure

```text
power-bi-lab/
├── Professional Profile.Report/
├── Professional Profile.SemanticModel/
├── Workday Monitor.Report/
├── Workday Monitor.SemanticModel/
├── LICENSE
└── README.md
```

Depending on the active Power BI/Fabric source-control representation, report and semantic-model definitions can contain PBIR, TMDL, and related metadata files inside these directories.

## Prerequisites

### Fabric Git restoration

You need:

- a Microsoft Fabric or eligible Power BI capacity, including an active Fabric trial where supported
- a Fabric workspace in which you can create and update items
- Workspace Admin permission to establish or change the Git connection
- an active GitHub account with access to this repository
- Fabric tenant settings that permit Git synchronization and GitHub integration
- a GitHub personal access token accepted by the Fabric Git integration flow, when requested

### Local Power BI development

You need:

- a current version of Power BI Desktop
- Git
- access to clone this repository
- Power BI Desktop project support for the repository artifacts

## Restore the project from GitHub to Microsoft Fabric

Use this method to test whether the repository can recreate the Fabric workspace artifacts.

1. Sign in to Microsoft Fabric.
2. Create a new empty workspace on a supported capacity. Use a temporary name such as `Power BI Lab Restore Test`.
3. Open the workspace and select **Workspace settings**.
4. Open **Git integration** and select **GitHub**.
5. Authenticate with GitHub when prompted.
6. Select the `kamilsoszka/power-bi-lab` repository.
7. Select the `main` branch.
8. Select the repository root unless the project has later been moved to a subdirectory.
9. Complete the connection.
10. Open the workspace **Source control** pane.
11. Review the incoming changes and select **Update all** or the equivalent update action.
12. Wait for the update to finish and confirm that the following items exist:
    - `Professional Profile` report
    - `Professional Profile` semantic model
    - `Workday Monitor` report
    - `Workday Monitor` semantic model
13. Open both reports and validate them using the checklist below.

### Expected restoration result

The workspace should contain two reports and two semantic models. The Source control pane should show no pending differences after a successful update, unless the Fabric service generates a supported metadata change.

### Restoration troubleshooting

| Symptom | Check |
| --- | --- |
| GitHub is not available as a provider | Confirm that the Fabric tenant administrator enabled GitHub synchronization. |
| The repository is not listed | Confirm repository access and GitHub authentication or token permissions. |
| Connect is unavailable | Confirm that the user is a Workspace Admin. |
| Update fails because of permissions | Confirm write access to all affected workspace items and required permissions for dependencies. |
| A report opens without its expected model | Confirm that both report and semantic-model directories exist and that all Git changes were applied. |
| The public link differs from the restored workspace report | `Publish to web` embed codes are service-side publishing artifacts and should be validated separately after restoration. |

## Develop locally with Power BI Desktop

1. Clone the repository:

   ```bash
   git clone https://github.com/kamilsoszka/power-bi-lab.git
   cd power-bi-lab
   ```

2. Open the Power BI Project entry point available in the cloned repository. If no `.pbip` entry file is present in the current Git-export representation, use Fabric Git integration as the authoritative restoration path.
3. Allow Power BI Desktop to load the report and semantic model.
4. Confirm that the Professional Profile and Workday Monitor artifacts load without errors.
5. Save only intentional changes.
6. Review the Git diff before committing, especially changes to report metadata and TMDL definitions.

## Recreate the Professional Profile helper table manually

Use this only when reconstructing the component manually instead of restoring the source-controlled semantic model.

Create a blank Power Query named `Professional Profile` and replace its complete content with:

```powerquery
let
    Source =
        #table(
            type table [Placeholder = text],
            {{"Professional Profile"}}
        )
in
    Source
```

After applying the query:

1. confirm that the table has one column named `Placeholder`
2. confirm that it has one row containing `Professional Profile`
3. add the complete light and dark DAX measures
4. assign both measures to the `Professional Profile` home table
5. set the data category of both measures to `Image URL`
6. place each measure in a visual that supports image URL rendering

## Semantic-model design

### Professional Profile

| Object | Purpose |
| --- | --- |
| `Professional Profile` | Disconnected technical helper table with one row. |
| `Professional Profile[Placeholder]` | Text placeholder; not a business attribute. |
| `Professional Profile SVG Light` | Generates the complete light SVG profile. |
| `Professional Profile SVG Dark` | Generates the complete dark SVG profile. |

Design rules:

- do not create relationships from the helper table
- keep the `Placeholder` column hidden from report consumers when practical
- keep both measures synchronized when changing content or coordinates
- preserve the `Image URL` data category
- validate the output after Power BI Desktop, Service, or model-engine updates

## Workday Monitor configuration

Default settings:

```text
Work start: 08:00
Work end:   16:00
Time zone:  Europe/Warsaw
Workdays:   Monday to Friday
```

The light and dark Workday Monitor measures must use matching schedule values. The `RefreshInfo` query records a UTC semantic-model refresh timestamp but does not initiate or configure scheduled refresh.

## Validation checklist

### Professional Profile

- [ ] The light report renders without an SVG or image error.
- [ ] The dark report renders without an SVG or image error.
- [ ] The embedded photograph appears in both variants.
- [ ] The Power BI experience value matches the intended start month.
- [ ] The Microsoft Fabric experience value matches the intended start date.
- [ ] The generated timestamp displays CET or CEST correctly for the test date.
- [ ] Text remains readable at normal browser zoom.
- [ ] The `BI` label has sufficient contrast in both themes.
- [ ] No element is visibly clipped in Power BI Desktop or Power BI Service.
- [ ] The mobile layout is checked separately in the Power BI mobile layout editor or application.

### Workday Monitor

- [ ] Status is correct before, during, and after the configured work interval.
- [ ] Elapsed and remaining time do not become negative.
- [ ] Progress remains within 0% to 100%.
- [ ] Weekend behavior matches the intended work calendar.
- [ ] CET and CEST boundary dates are tested.
- [ ] Refresh metadata is labeled as model refresh time, not live current time.

### Source control and restoration

- [ ] A clean workspace can connect to the repository and `main` branch.
- [ ] Both reports and both semantic models are created from Git.
- [ ] Source control shows no unexpected pending differences after restoration.
- [ ] Reports remain connected to their intended semantic models.
- [ ] The README steps can be completed by a user unfamiliar with the original workspace.

### Public-sharing review

- [ ] Every field in the model is approved for unrestricted public disclosure.
- [ ] No confidential or proprietary data is present.
- [ ] No hidden page or drill-through path exposes unintended data.
- [ ] No tooltip or exportable detail exposes unintended data.
- [ ] Public links are still required and intentionally active.

## Known boundaries

- SVG rendering depends on the Power BI visual and service surface that interprets the image URL.
- A fixed SVG `viewBox` provides proportional scaling but does not guarantee identical rendering across every device, browser zoom level, or Power BI client.
- `UTCNOW()` reflects DAX evaluation behavior and does not create a continuously updating browser clock.
- Base64 image embedding removes the dependency on public image hosting but increases measure size and makes source-control diffs harder to review.
- The light and dark measures duplicate layout and business logic, so changes must be applied consistently to both.
- Git integration restores supported source-controlled Fabric items. Service configuration, permissions, credentials, scheduled refresh, apps, and public embed codes can require separate configuration or validation.
- `Publish to web` bypasses authentication and must never be treated as a secure sharing mechanism.

## Security and privacy

This repository is designed for deliberately public portfolio content. Before publishing a modified version:

1. inspect all model tables, including hidden columns
2. inspect report pages, hidden pages, tooltips, and drill-through targets
3. remove secrets, tokens, connection strings, and private endpoints
4. remove employer, customer, or third-party information that is not approved for publication
5. verify that the embedded photograph and professional-profile details are intentionally public
6. review the active `Publish to web` embed code in Power BI Service

## Suggested change workflow

1. Create a Git branch.
2. Make and validate one logical change.
3. Compare light and dark variants where applicable.
4. Review the PBIP/TMDL diff.
5. Commit with a focused message.
6. Merge through a pull request.
7. Update the Fabric workspace from Git.
8. Re-run the validation checklist.

Example commit messages:

```text
fix: improve dark theme BI badge contrast
refactor: simplify Professional Profile helper table
docs: add Fabric Git restoration instructions
```

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
