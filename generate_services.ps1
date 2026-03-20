
$services = @(
    @{
        Title = "Secure Data Destruction"
        File = "service-data-destruction.html"
        Icon = "bi-shield-slash"
        HeroImg = "https://images.unsplash.com/photo-1597848212624-a19eb35e2651?auto=format&fit=crop&q=80&w=800"
        Summary = "On-site and off-site data destruction services tailored to high-security environments."
        Sub1 = "Physical Shredding"
        Desc1 = "Industrial shredders capable of reducing hard drives and SSDs to 2mm fractions."
        Icon1 = "bi-cone-striped"
        Sub2 = "Cryptographic Erasure"
        Desc2 = "Software-based wiping that securely erases data while preserving the physical drive's hardware value."
        Icon2 = "bi-file-earmark-lock"
        MainText = "We provide on-site and off-site data destruction services tailored to high-security environments. All operations comply with NIST 800-88 and DoD 5220.22-M military-grade standards."
    },
    @{
        Title = "IT Asset Value Recovery"
        File = "service-value-recovery.html"
        Icon = "bi-box-seam"
        HeroImg = "https://images.unsplash.com/photo-1581092160562-40aa08e78837?auto=format&fit=crop&q=80&w=800"
        Summary = "Global remarketing program to recover maximum ROI on your decommissioned IT hardware."
        Sub1 = "Refurbishment & Resale"
        Desc1 = "Testing and repairing assets to meet grade-A secondary market standards for maximum return."
        Icon1 = "bi-boxes"
        Sub2 = "Component Harvesting"
        Desc2 = "Recovering valuable parts like RAM and CPUs from non-functional units to fuel global supply chains."
        Icon2 = "bi-cpu"
        MainText = "Maximize your return on investment through our global remarketing network. We analyze current market trends to ensure you receive top-tier payouts for your legacy enterprise systems."
    },
    @{
        Title = "e-Waste Lifecycle Management"
        File = "service-ewaste-recycling.html"
        Icon = "bi-recycle"
        HeroImg = "https://images.unsplash.com/photo-1532996122724-e3c354a0b15b?auto=format&fit=crop&q=80&w=800"
        Summary = "R2v3 certified recycling processes ensuring zero electronic waste enters landfills."
        Sub1 = "Circular Economy Compliance"
        Desc1 = "Rigorous sorting and smelting processes that return raw materials back into the production cycle."
        Icon1 = "bi-arrow-repeat"
        Sub2 = "Hazardous Material Focus"
        Desc2 = "Safe extraction and disposal of lead, mercury, and other toxic components found in older electronics."
        Icon2 = "bi-exclamation-triangle"
        MainText = "Our R2v3 certified recycling guarantees that no part of your IT asset ever ends up in a landfill. We focus on environmental stewardship through comprehensive material recovery."
    },
    @{
        Title = "Data Center Decommissioning"
        File = "service-decommissioning.html"
        Icon = "bi-server"
        HeroImg = "https://images.unsplash.com/photo-1558494949-ef010915228c?auto=format&fit=crop&q=80&w=800"
        Summary = "Safe, coordinated tear-down of complex server infrastructures and hyper-scale environments."
        Sub1 = "De-raking & Extraction"
        Desc1 = "White-glove removal of server blades, SANs, and switches without disrupting surrounding active equipment."
        Icon1 = "bi-layers"
        Sub2 = "Cable Management Clearing"
        Desc2 = "Professional removal of miles of fiber and copper cabling, ensuring a clean floor for the next tenant."
        Icon2 = "bi-usb"
        MainText = "Specialized engineering teams trained for live, mission-critical environments. We handle everything from single racks to massive cloud-scale facility closures."
    },
    @{
        Title = "Secure Global Logistics"
        File = "service-logistics.html"
        Icon = "bi-geo-alt"
        HeroImg = "https://images.unsplash.com/photo-1586528116311-ad861a862412?auto=format&fit=crop&q=80&w=800"
        Summary = "GPS-tracked vehicles and secure point-to-point transit guarding chain of custody."
        Sub1 = "Armored Transport Options"
        Desc1 = "High-security vehicles with two-factor access control and 24/7 video monitoring of the cargo bay."
        Icon1 = "bi-shield-check"
        Sub2 = "Real-time Fleet Tracking"
        Desc2 = "Client-facing portal to monitor the exact GPS location and internal temperature of your asset transit."
        Icon2 = "bi-reception-4"
        MainText = "We eliminate the 'logistics gap.' Our owned fleet and background-checked drivers ensure that your data is never left unattended from pickup to final destruction."
    },
    @{
        Title = "ITAD Audit & Compliance"
        File = "service-audit-compliance.html"
        Icon = "bi-clipboard-check"
        HeroImg = "https://images.unsplash.com/photo-1450101499163-c8848c66ca85?auto=format&fit=crop&q=80&w=800"
        Summary = "Comprehensive reporting and serialized certificates of destruction for your compliance needs."
        Sub1 = "NIST 800-88 Reports"
        Desc1 = "Detailed logs including device type, serial number, and verification method for every asset."
        Icon1 = "bi-file-earmark-text"
        Sub2 = "Boardroom Ready Dashboards"
        Desc2 = "Summaries of carbon offset and value recovery metrics ready for your corporate ESG reporting."
        Icon2 = "bi-graph-up-arrow"
        MainText = "Transparency is our core value. We provide the documentation required to pass any third-party data security audit, from HIPAA to SOC2 and GDPR."
    }
)

$template = Get-Content 'service-details.html' -Raw

foreach ($s in $services) {
    $content = $template
    $content = $content -replace '<title>.*?</title>', "<title>$($s.Title) | ITAD Core</title>"
    $content = $content -replace '<h1 class="section-title">.*?</h1>', "<h1 class='section-title'>$($s.Title)</h1>"
    $content = $content -replace '<p class="text-muted mx-auto mt-3" style="max-width: 600px;">.*?</p>', "<p class='text-muted mx-auto mt-3' style='max-width: 600px;'>$($s.Summary)</p>"
    $content = $content -replace '<img src=".*?" alt=".*?"', "<img src='$($s.HeroImg)' alt='$($s.Title)'"
    $content = $content -replace '<h2>Absolute Data Security</h2>', "<h2>$($s.Title)</h2>"
    $content = $content -replace '<p class="text-muted mb-4">We provide on-site and off-site data destruction.*?</p>', "<p class='text-muted mb-4'>$($s.MainText)</p>"
    
    $content = $content -replace '<h4><i class="bi bi-cone-striped text-accent"></i> Physical Shredding</h4>', "<h4><i class='bi $($s.Icon1) text-accent'></i> $($s.Sub1)</h4>"
    $content = $content -replace '<p class="text-muted">Industrial shredders capable of reducing hard drives.*?</p>', "<p class='text-muted'>$($s.Desc1)</p>"
    
    $content = $content -replace '<h4><i class="bi bi-file-earmark-lock text-accent"></i> Cryptographic Erasure</h4>', "<h4><i class='bi $($s.Icon2) text-accent'></i> $($s.Sub2)</h4>"
    $content = $content -replace '<p class="text-muted">Software-based wiping that securely erases data.*?</p>', "<p class='text-muted'>$($s.Desc2)</p>"
    
    Set-Content $s.File $content
    Write-Host "Generated $($s.File)"
}
