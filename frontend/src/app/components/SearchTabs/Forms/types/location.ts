export type LocationProps = {
    city: string,
    code: string,
    country: string,
    timezone: string,
}

export function locationToString(location: LocationProps | undefined): string {
    if (!location) return "";
    return `${location.city} (${location.code}), ${location.country}`;
}

export type RegionProps = {
    name: string,
    destinations: LocationProps[],
}
