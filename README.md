# Power BI Lab

Power BI portfolio repository featuring advanced DAX, Power Query, semantic modeling, responsive report design, and dynamic SVG visualizations with coordinated light and dark themes.

## Live Reports

### Professional Profile

Interactive Power BI report presenting professional experience, Microsoft certifications, analytics, data engineering, and AI capabilities.

[Open Professional Profile in Power BI](https://app.powerbi.com/view?r=eyJrIjoiYTJlZWUxYTUtOGQxNS00ODU3LWIxNjktYzIxMDY3ZGIwZWM5IiwidCI6Ijc2NGY3ZmY0LTY2OWQtNDAwYi1iMDY0LTM4NTAyNDAxMTNiYiIsImMiOjl9)

### Workday Monitor

Dynamic workday monitoring report with schedule tracking, elapsed and remaining time, progress calculations, workday status, and Europe/Warsaw CET and CEST handling.

[Open Workday Monitor in Power BI](https://app.powerbi.com/view?r=eyJrIjoiMjU1NjRiMDktZDVkYS00MWU5LWJmZjYtNTRhM2EzNGUzMjJiIiwidCI6Ijc2NGY3ZmY0LTY2OWQtNDAwYi1iMDY0LTM4NTAyNDAxMTNiYiIsImMiOjl9)

## Project Features

- Advanced DAX measures
- Power Query scripts used by the deployed Power BI Pro solution
- Self-contained SVG visualizations returned as Image URL values
- Coordinated light and dark themes inspired by Microsoft Fabric
- Embedded profile photo stored directly in DAX as Base64
- Responsive desktop and mobile report layouts
- Europe/Warsaw CET and CEST handling implemented in DAX
- Dynamic workday progress and status calculations
- Semantic modeling
- Reusable Power BI development components
- Public Power BI report demonstrations
- Power BI Pro workspace and app deployment
- Git-integrated Power BI Project structure

## Repository Structure

```text
power-bi-lab/
├── Professional Profile.Report/
├── Professional Profile.SemanticModel/
├── Workday Monitor.Report/
├── Workday Monitor.SemanticModel/
├── LICENSE
└── README.md
```

## DAX Measures

The measures generate complete SVG visualizations and return them as Power BI-compatible data URIs.

The current SVG measures do not require a `RefreshInfo` table. The displayed `GENERATED` timestamp represents the measure evaluation time converted to Europe/Warsaw local time. It does not represent semantic model refresh metadata.

## Power Query Scripts

The Power Query scripts used by the deployed Power BI Pro solution remain active server-side components.

The obsolete `refresh-info.pq` script was removed because the current SVG measures calculate the displayed `GENERATED` timestamp directly in DAX.

## Installation

### 1. Add the Power Query scripts where required

For a deployed solution that uses the Power Query scripts:

1. Open **Transform data** in Power BI Desktop.
2. Select **New source**, followed by **Blank query**.
3. Open **Advanced Editor**.
4. Paste the complete contents of the corresponding `.pq` file.
5. Assign the appropriate query name.
6. Select **Close & Apply**.

The two Power Query scripts remain part of the deployed Power BI Pro solution, but neither script provides refresh metadata to the SVG measures.

### 2. Add a DAX measure

1. Open the Power BI Desktop model.
2. Select the table that should store the measure.
3. Select **New measure**.
4. Copy and paste the complete measure definition from the corresponding `.dax` file.
5. Set **Data category** to **Image URL**.
6. Add the measure to a visual that supports Image URL values.

### 3. Configure the visual

For best results:

- Disable the visual title.
- Disable the visual background.
- Disable the visual border.
- Minimize internal padding.
- Preserve the intended SVG aspect ratio.
- Validate rendering in both Power BI Desktop and Power BI Service.

## Workday Monitor Configuration

The default configuration is:

```text
Work start: 08:00
Work end:   16:00
Time zone:  Europe/Warsaw
Workdays:   Monday to Friday
```

The schedule can be changed in both Workday Monitor measures:

```dax
VAR WorkStartTime = TIME(8, 0, 0)
VAR WorkEndTime = TIME(16, 0, 0)
```

Keep the same values in the light and dark measures to preserve consistent calculations.

## Time-Zone Handling

The measures calculate the Europe/Warsaw daylight-saving-time conversion directly in DAX:

```text
CET  = UTC+1
CEST = UTC+2
```

The applicable offset is determined using the final Sunday of March and the final Sunday of October.

## Generated Timestamp

The SVG footer displays `GENERATED`, followed by the current Europe/Warsaw date and time calculated from `UTCNOW()`:

```dax
VAR CurrentUtcDateTime = UTCNOW()
```

This value represents measure evaluation time. Pure DAX does not provide a reliable semantic model refresh timestamp without an external metadata source or supporting refresh table.

## Professional Profile

The Professional Profile measures include:

- An embedded circular profile photo
- A professional summary
- Power BI and Microsoft Fabric experience calculations
- Microsoft certifications
- Education
- Analytics, data engineering, and AI capabilities
- Coordinated light and dark palettes
- A DAX-generated Europe/Warsaw timestamp

The profile photo is embedded directly in the measure as a Base64 JPEG and does not depend on an external image URL.

## Light and Dark Modes

Both report components are available in coordinated variants:

```text
Professional Profile Light
Professional Profile Dark
Workday Monitor Light
Workday Monitor Dark
```

Each light and dark pair preserves the same layout, calculations, labels, dimensions, font hierarchy, and information structure. Only the visual color system changes.

## Mobile Layout

Both reports include layouts designed for Power BI mobile experiences.

Rendering should be validated separately in:

- Power BI Desktop
- Power BI Service
- Power BI mobile applications
- Different browsers and browser zoom levels

## Known Limitations

- The project is intended for development, demonstration, portfolio, and educational use.
- Workday Monitor is not an employee attendance or time-registration system.
- Current time and progress values depend on report or semantic model recalculation.
- `UTCNOW()` does not provide a continuously running client-side clock.
- The displayed `GENERATED` value is not a semantic model refresh timestamp.

## Skills Demonstrated

- **Advanced DAX:** Complex measures for time-zone handling, dynamic status calculations, and self-contained SVG visualizations.
- **Power Query (M):** Data transformation scripts used by the deployed Power BI solution.
- **Data Visualization and UI/UX:** Responsive layouts, custom SVG graphics, and coordinated light and dark themes.
- **Semantic Modeling:** Structured semantic models designed for report integration and maintainability.
- **Power BI Project structure:** Source-controlled report and semantic model definitions.
- **Power BI Deployment:** Publishing and managing reports in a Power BI Pro workspace and app environment.
- **Git Integration:** Version-controlled Power BI development artifacts stored in GitHub.

## Challenges and Lessons Learned

### DAX SVG generation

Constructing complex, self-contained SVG graphics using DAX required careful string manipulation, dynamic-variable handling, and Base64 image embedding without breaking the data URI structure.

### Time-zone handling

Implementing Europe/Warsaw CET and CEST conversion without an external API required precise logic for calculating the final Sundays of March and October.

### Responsive design

Maintaining consistent layouts, calculations, dimensions, and font hierarchies across light and dark variants required validation in Power BI Desktop, Power BI Service, mobile layouts, and different browser configurations.

### Source control

Separating report definitions from semantic model definitions provides a clearer Power BI Project structure and improves version control, maintainability, and Git-based development.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
