# Power BI Lab

Power BI development lab featuring advanced DAX measures, Power Query transformations, semantic models, responsive report design, and dynamic SVG visualizations in coordinated light and dark modes.

## Live Reports

### Professional Profile

Interactive Power BI report presenting professional experience, Microsoft certifications, analytics, data engineering, and AI capabilities.

[Open Professional Profile in Power BI](https://app.powerbi.com/view?r=eyJrIjoiMjU1NjRiMDktZDVkYS00MWU5LWJmZjYtNTRhM2EzNGUzMjJiIiwidCI6Ijc2NGY3ZmY0LTY2OWQtNDAwYi1iMDY0LTM4NTAyNDAxMTNiYiIsImMiOjl9)

#### Light mode

![Professional Profile light mode](assets/images/professional-profile-light.png)

#### Dark mode

![Professional Profile dark mode](assets/images/professional-profile-dark.png)

---

### Workday Monitor

Dynamic workday monitoring report with schedule tracking, elapsed and remaining time, progress calculations, workday status, Europe/Warsaw time-zone handling, and semantic model refresh metadata.

[Open Workday Monitor in Power BI](https://app.powerbi.com/view?r=eyJrIjoiYTJlZWUxYTUtOGQxNS00ODU3LWIxNjktYzIxMDY3ZGIwZWM5IiwidCI6Ijc2NGY3ZmY0LTY2OWQtNDAwYi1iMDY0LTM4NTAyNDAxMTNiYiIsImMiOjl9)

#### Light mode

![Workday Monitor light mode](assets/images/workday-monitor-light.png)

#### Dark mode

![Workday Monitor dark mode](assets/images/workday-monitor-dark.png)

## Project Features

- Advanced DAX measures
- Dynamic SVG visualizations
- Coordinated light and dark mode designs
- Power BI semantic models
- Power Query transformations
- Desktop and mobile report layouts
- Europe/Warsaw CET and CEST handling
- Semantic model refresh metadata
- Reusable Power BI development components
- Public Power BI report demonstrations
- Power BI Pro workspace and app deployment

## Repository Structure

```text
power-bi-lab/
├── assets/
│   └── images/
│       ├── professional-profile-light.png
│       ├── professional-profile-dark.png
│       ├── workday-monitor-light.png
│       └── workday-monitor-dark.png
├── dax/
│   ├── professional-profile-light.dax
│   ├── professional-profile-dark.dax
│   ├── workday-monitor-light.dax
│   └── workday-monitor-dark.dax
├── power-query/
│   ├── professional-profile.pq
│   ├── refresh-info.pq
│   └── workday-monitor.pq
├── LICENSE
└── README.md
```

## DAX Measures

The `dax` directory contains four complete Power BI measures:

- `professional-profile-light.dax`
- `professional-profile-dark.dax`
- `workday-monitor-light.dax`
- `workday-monitor-dark.dax`

Each measure generates a self-contained SVG visualization returned as a Power BI-compatible data URI.

## Power Query Scripts

The `power-query` directory contains three complete Power Query scripts:

- `professional-profile.pq`
- `workday-monitor.pq`
- `refresh-info.pq`

Required query names in Power BI:

```text
Professional Profile
Workday Monitor
RefreshInfo
```

## Installation

### 1. Create the supporting tables

1. Open **Transform data** in Power BI Desktop.
2. Select **New source**.
3. Select **Blank query**.
4. Open **Advanced Editor**.
5. Remove the existing code.
6. Paste the complete contents of the corresponding `.pq` file.
7. Assign the required query name.
8. Select **Close & Apply**.

### 2. Add the DAX measures

1. Select the appropriate supporting table.
2. Select **New measure**.
3. Paste the complete contents of the corresponding `.dax` file.
4. Assign the measure to the correct home table.
5. Set **Data category** to **Image URL**.
6. Add the measure to a visual supporting Image URL values.

## Workday Monitor Configuration

The default configuration is:

```text
Work start: 08:00
Work end:   16:00
Time zone:  Europe/Warsaw
Workdays:   Monday to Friday
```

The schedule can be changed in both Workday Monitor measures:

```DAX
VAR WorkStartTime =
    TIME(8, 0, 0)

VAR WorkEndTime =
    TIME(16, 0, 0)
```

The same values should be maintained in the light and dark measures.

## Time-Zone Handling

The Workday Monitor supports Europe/Warsaw daylight-saving-time conversion:

```text
CET  = UTC+1
CEST = UTC+2
```

The applicable offset is calculated using the final Sunday of March and the final Sunday of October.

## Refresh Metadata

The `RefreshInfo` query records the semantic model refresh timestamp in UTC:

```powerquery
DateTimeZone.FixedUtcNow()
```

The query creates the following column:

```text
LastRefreshUTC
```

The DAX measures convert the UTC timestamp to Europe/Warsaw local time. The query records refresh metadata but does not configure or initiate scheduled refresh.

## Light and Dark Modes

Both report components are available in coordinated light and dark variants:

```text
Professional Profile Light
Professional Profile Dark
Workday Monitor Light
Workday Monitor Dark
```

The paired measures preserve the same layout, calculations, labels, dimensions, font family, and information hierarchy.

## Mobile Layout

Both reports include layouts designed for Power BI mobile experiences.

Rendering should be validated separately in:

- Power BI Desktop
- Power BI Service
- Power BI mobile applications
- different browser zoom levels
- PDF exports
- PowerPoint exports

## Known Limitations

- The project is intended for development, demonstration, portfolio, and educational use.
- The Workday Monitor is not an employee attendance or time-registration system.
- Current time and progress values depend on report or semantic model recalculation.
- `UTCNOW()` does not provide a continuously running client-side clock.
- Public holidays are not included.
- Weekends are defined as Saturday and Sunday.
- Overnight shifts crossing midnight are not supported by the default configuration.
- The default schedule is fixed at 08:00-16:00.
- The `RefreshInfo` query records metadata but does not configure scheduled refresh.
- SVG rendering can vary between Power BI environments and export formats.
- Published reports are public and must not contain confidential or restricted information.

## Project Status

```text
Project:     Power BI Lab
Version:     1.0.0
Status:      Development / Portfolio
Endorsement: Promoted
Platform:    Power BI Pro
License:     MIT
```

## Disclaimer

The content in this repository is experimental and must not be treated as production-ready or as an official source of business information.

The public Power BI reports are provided for portfolio, demonstration, and educational purposes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
