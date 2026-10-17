// Reference: generate WebSite + SoftwareApplication JSON-LD from a per-site
// config. Framework-agnostic; emit the result once in the root <head>.

export type SiteSeoConfig = {
  name: string;
  /** Short name -> alternateName. */
  alternateName?: string;
  /** Own origin, no trailing slash, e.g. "https://example.com". */
  url: string;
  description: string;
  /** Absolute or root-relative logo URL. */
  logo: string;
  inLanguage: string[]; // e.g. ['en', 'zh']
  applicationCategory?: string; // e.g. 'BusinessApplication'
  operatingSystem?: string; // e.g. 'Web'
  offers?: { price: string; priceCurrency: string };
  publisher?: { name: string; url: string };
};

const abs = (base: string, p: string) =>
  /^https?:\/\//i.test(p) ? p : `${base}${p.startsWith('/') ? '' : '/'}${p}`;

export function buildSiteJsonLd(site: SiteSeoConfig) {
  const url = `${site.url}/`;
  const alt = site.alternateName ? { alternateName: site.alternateName } : {};
  return {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'WebSite',
        '@id': `${url}#website`,
        name: site.name,
        ...alt,
        url,
        description: site.description,
        inLanguage: site.inLanguage,
      },
      {
        '@type': 'SoftwareApplication',
        '@id': `${url}#app`,
        name: site.name,
        ...alt,
        url,
        description: site.description,
        image: abs(site.url, site.logo),
        applicationCategory: site.applicationCategory ?? 'WebApplication',
        operatingSystem: site.operatingSystem ?? 'Web',
        inLanguage: site.inLanguage,
        ...(site.offers ? { offers: { '@type': 'Offer', ...site.offers } } : {}),
        ...(site.publisher
          ? { publisher: { '@type': 'Organization', ...site.publisher } }
          : {}),
      },
    ],
  };
}

/** Serialize safely for <script type="application/ld+json">. */
export function serializeJsonLd(data: unknown): string {
  return JSON.stringify(data).replace(/</g, '\\u003c');
}

// TanStack Start root route:
//   head: () => ({ scripts: [{ type: 'application/ld+json',
//     children: serializeJsonLd(buildSiteJsonLd(siteConfig)) }] })
// Next.js app/layout.tsx:
//   <script type="application/ld+json"
//     dangerouslySetInnerHTML={{ __html: serializeJsonLd(buildSiteJsonLd(siteConfig)) }} />
