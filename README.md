# Power BI Lab

Power BI development and portfolio project featuring advanced DAX, Power Query, semantic modeling, responsive report design, and dynamic SVG visualizations in coordinated light and dark modes.

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

## Repository Structure

```text
power-bi-lab/
├── fabric-workspace/
├── LICENSE
└── README.md
```

## DAX Measures

The measures generate complete SVG visualizations and return them as Power BI-compatible data URIs. The current SVG measures do not require a `RefreshInfo` table. The displayed `GENERATED` timestamp represents the measure evaluation time converted to Europe/Warsaw local time. It does not represent semantic model refresh metadata.

## Power Query Scripts

The Power Query scripts used by the deployed Power BI Pro solution remain active server-side components. The obsolete `refresh-info.pq` script was removed because the current SVG measures calculate the displayed `GENERATED` timestamp directly in DAX.

## Installation

### 1. Add the Power Query scripts where required

For the deployed solution that uses the Power Query scripts:

1. Open **Transform data** in Power BI Desktop.
2. Select **New source** and then **Blank query**.
3. Open **Advanced Editor**.
4. Paste the complete contents of the corresponding `.pq` file.
5. Assign the appropriate query name.
6. Select **Close & Apply**.

The two Power Query scripts remain part of the deployed Power BI Pro solution, but neither script provides refresh metadata to the SVG measures.

### 2. Add a DAX measure

1. Open the Power BI Desktop model.
2. Select the table that should store the measure.
3. Select **New measure**.
4. Copy and paste the complete measure definition from the `.dax` file.
5. Set **Data category** to **Image URL**.
6. Add the measure to a visual that supports Image URL values.

### 3. Configure the visual

For best results:

- disable the visual title,
- disable the visual background,
- disable the visual border,
- minimize internal padding,
- preserve the intended SVG aspect ratio,
- validate rendering in both Power BI Desktop and Power BI Service.

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

The measures calculate Europe/Warsaw daylight-saving-time conversion directly in DAX:

```text
CET  = UTC+1
CEST = UTC+2
```

The applicable offset is determined using the final Sunday of March and the final Sunday of October.

## Generated Timestamp

The SVG footer displays `GENERATED` followed by the current Europe/Warsaw date and time calculated from `UTCNOW()`.

```dax
VAR CurrentUtcDateTime = UTCNOW()
```

This value represents measure evaluation time. Pure DAX does not provide a reliable semantic model refresh timestamp without an external metadata source or supporting refresh table.

## Professional Profile

The Professional Profile measures include:

- an embedded circular profile photo,
- professional summary,
- Power BI and Microsoft Fabric experience calculations,
- certifications,
- education,
- analytics, data engineering, and AI capabilities,
- coordinated light and dark palettes,
- a DAX-generated Europe/Warsaw timestamp.

The profile photo is embedded directly in the measure as a Base64 JPEG and does not depend on an external image URL.

## Light and Dark Modes

Both report components are available in coordinated variants:

```text
Professional Profile Light
Professional Profile Dark
Workday Monitor Light
Workday Monitor Dark
```

Each light and dark pair preserves the same layout, calculations, labels, dimensions, font hierarchy, and information structure. Only the visual color system changes between modes.

## Mobile Layout

Both reports include layouts intended for Power BI mobile experiences. Rendering should be validated separately in:

- Power BI Desktop,
- Power BI Service,
- Power BI mobile applications,
- different browser zoom levels.

## Known Limitations

- The project is intended for development, demonstration, portfolio, and educational use.
- Workday Monitor is not an employee attendance or time-registration system.
- Current time and progress values depend on report or semantic model recalculation.
- `UTCNOW()` does not provide a continuously running client-side clock.

## Skills Demonstrated

- **Advanced DAX:** Creating complex measures for time-zone handling, dynamic status calculations, and self-contained SVG visualizations.
- **Power Query (M):** Developing data transformation scripts for the deployed Power BI solution.
- **Data Visualization & UI/UX:** Designing responsive report layouts, custom SVG graphics, and coordinated light/dark themes.
- **Semantic Modeling:** Structuring data models for optimal performance and direct visual integration.
- **Power BI Deployment:** Publishing and managing reports within a Power BI Pro workspace and app environment.

## Challenges and Lessons Learned

- **DAX SVG Generation:** Constructing complex, self-contained SVG graphics using pure DAX required careful string manipulation, handling dynamic variables, and embedding Base64 images without breaking the data URI schema.
- **Time-Zone Handling in DAX:** Implementing accurate Europe/Warsaw CET and CEST conversions manually (without external APIs) required precise logic for calculating the final Sundays of March and October.
- **Responsive UI Coordination:** Ensuring that the light and dark mode variants maintained identical pixel-perfect layouts and font hierarchies across Desktop, Service, and mobile devices required rigorous visual validation.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
