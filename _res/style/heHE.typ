#import "@preview/muchpdf:0.1.0": muchpdf

#let ledare = color.rgb(204,0,0)

#let rubrik(it, name, width: 100%, titlesize: 32pt, linewidth: 80%, author_color: ledare) =[
  #text(size:titlesize, [#box(width: width, it)])
  #v(-1cm)
  #line(length: linewidth, stroke: 0.5pt)
  #v(-1em)
  #text(size: 18pt,fill: author_color, emph(name))
]

#let blockquote(quote, size: 14pt, width: 80%) = {
    align(center, box(width: width,text(size: size,strong(quote))))
}

#let frontpage_a5(
  month: none,
  inverted: false,
  path: none,
  type: none,
  doc
) = [
  #page(paper: "a5",
  background: [    
      #if path != none [#image(path,height: 100%,fit: "stretch")]]
      ,
      [ 
    
    #if inverted == true {[ 
    #align(center,[
      #v(1cm)
      #text(size:78pt,fill:white,font:"New Computer Modern",[H#h(-7pt)#box(height: 52pt,image("../graphics/rune_white.svg"))H#box(height: 52pt,image("../graphics/krusidull_white.svg"))])
    ])
    #v(-2.85cm)
    #grid(
      columns: (20%,60%,20%),rows: (4pt,0.9em),
      grid.hline(stroke: (white)),
      [],[],[],
      [#text(fill:white,size: 9pt,[_Hent i Hus E_])],[#align(center,[#h(4pt)#text(fill: white,size:9pt,[#emph(upper(month))])])],
      [#align(right,text(size: 9pt,fill:white,[0,00 kr]))]
      ,grid.hline(stroke: (white))
    )
  ]} else {[
    #align(center,[
      #v(1cm)
      #text(size:78pt,font:"New Computer Modern",[H#h(-7pt)#box(height: 52pt,image("../graphics/rune.svg"))H#box(height: 52pt,image("../graphics/krusidull.svg"))])
    ])
    #v(-2.85cm)
    #grid(
      columns: (20%,60%,20%),rows: (4pt,0.9em),
      grid.hline(),
      [],[],[],
      [#text(size: 9pt,[_Hent i Hus E_])],[#align(center,[#h(4pt)#text(size:9pt,[#emph(upper(month))])])],
      [#align(right,text(size: 9pt,[0,00 kr]))]
      ,grid.hline()
    )
  ]}

]

) 
]

#let frontpage_a4(
  month: none,
  inverted: false,
  path: none,
  doc
) = [
  #page(paper: "a4",
  background: [    
      #if path != none [#image(path,height: 100%,fit: "stretch",alt: "hej")]]
      ,
      [ 
    #if inverted == true {[ 
    #align(center,[
      #v(1cm)
      #text(size:78pt,fill:white,font:"New Computer Modern",[H#h(-7pt)#box(height: 52pt,image("../graphics/rune_white.svg"))H#box(height: 52pt,image("../graphics/krusidull_white.svg"))])
    ])
    #v(-2.85cm)
    #grid(
      columns: (20%,60%,20%),rows: (4pt,0.9em),
      grid.hline(stroke: (white)),
      [],[],[],
      [#text(fill:white,size: 11pt,[_Hent i Hus E_])],[#align(center,[#h(4pt)#text(fill: white,size:11pt,[#emph(upper(month))])])],
      [#align(right,text(size: 11pt,fill:white,[0,00 kr]))]
      ,grid.hline(stroke: (white))
    )
  ]} else {[
    #align(center,[
      #v(1cm)
      #text(size:110pt,font:"New Computer Modern",[H#h(-7pt)#box(height: 76pt,image("../graphics/rune.svg"))H#box(height: 76pt,image("../graphics/krusidull.svg"))])
    ])
    #v(-3.85cm)
    #grid(
      columns: (20%,60%,20%),rows: (4pt,0.9em),
      grid.hline(),
      [],[],[],
      [#text(size: 11pt,[_Hent i Hus E_])],[#align(center,[#h(4pt)#text(size:11pt,[#emph(upper(month))])])],
      [#align(right,text(size: 11pt,[0,00 kr]))]
      ,grid.hline()
    )
  ]}

]

) 
]

#let external_page(img_path) = [
  #page(background: image(img_path,height: 100%,fit: "stretch",alt: "hej"),[])
]
#let external_pdf(img_path) = [
  #page(background: muchpdf(
  read(img_path, encoding: none),
  height: 100%,
),[])
]



#let conf(
  month: none,
  papersize: "a4",
  indent: false,
  inverted: false,
  path: none,
  doc
) = {

  set text(size: 12pt,font: "New Computer Modern",lang: "sv")
  
  counter(page).update(0)
  if papersize == "a5" {frontpage_a5(month:month,path:path,inverted:inverted,[])} else {frontpage_a4(month:month,path:path,inverted:inverted,[])
  }
  pagebreak()
  
  
  
  set page(
    paper: papersize,
    header: [
      #if papersize == "a5" {[
      #grid(
        columns: (20%,30%,30%,20%),
        [#text(size: 8pt,[_Hent i Hus E_])],[#align(right,[#text(size:8pt,[*HeHE*])#h(4pt)])],[#align(left,[#h(4pt)#text(size:8pt,[#emph(upper(month))])])],[#align(right,text(size:8pt,[_#context(counter(page).display())_]))]
      )
      #v(-4pt)
      #line(stroke: 0.4pt,length: 100%)
    ]} else {[
      #grid(
        columns: (20%,30%,30%,20%),
        [#text(size: 10pt,[_Hent i Hus E_])],[#align(right,[#text(size:10pt,[*HeHE*])#h(4pt)])],[#align(left,[#h(4pt)#text(size:10pt,[#emph(upper(month))])])],[#align(right,text(size:10pt,[_#context(counter(page).display())_]))]
      )
      #v(-4pt)
      #line(stroke: 0.6pt,length: 100%)
    ]}
      
    ],
    margin: (top:20mm,inside:15mm,outside:20mm,bottom:20mm),
  )

  set par(
    justify: true,
    first-line-indent: if indent {1.5em} else {0em},
    spacing: if indent { 0.65em } else { 1.2em }
  )

  //set smartquote(quotes: "»«")
  
  
  doc
}