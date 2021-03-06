import Foundation

public struct Day10 {
    public static let sample = [
        "[({(<(())[]>[[{[]{<()<>>",
        "[(()[<>])]({[<{<<[]>>(",
        "{([(<{}[<>[]}>{[]{[(<()>",
        "(((({<>}<{<{<>}{[]{[]{}",
        "[[<[([]))<([[{}[[()]]]",
        "[{[{({}]{}}([{[{{{}}([]",
        "{<[[]]>}<{[{[{[]{()[[[]",
        "[<(<(<(<{}))><([]([]()",
        "<{([([[(<>()){}]>(<<{{",
        "<{([{{}}[<[[[<>{}]]]>[]]"
    ]
    
    public static let input = [
        "({[[{[(([({((<[]>{[][]})[{<>[]}{[]{}}])[<[<><>][[]{}]>{[{}()][{}]}]}(<[{<>{}}[()]]<[{}[]]>><[{()}({}())]",
        "[[<([<<<((([<<()()>{{}()}>[[()<>]]]{<{<>[]}(()<>)>[<{}{}>[{}]]}){{({<>()}{[]})<[[][]]>}[{[",
        "[{{<{({<<({{{<[]><<>[]>}{{()()}(<>[])}}<[{(){}}<<>{}>]((<>[]){{}{}})>}([[{[]<>]][(<>[])(()<>)]])){[",
        "[<([({{{<{[[[{{}{}}]{<[]()>([]}}][({()()}){<()<>><(){}>}]]<<(<[][]>({}{}))([[]<>]<[]()>)>{({<>[]}{",
        "[{(({<({(<(({<[]{}>(<>())}[([]()){()<>}]){<<(){}>{()<>}>[{<>{}}{<>()}]})({[<<>()><{}[]>]})>)[{([[{(){",
        "(<(({[<{[{[{<[()<>](()[])>}[<[()<>]((){})>([<>[]][[]{}])]]([[[[][]](()[])]<(<><>)<[]<>>>][{(<>{})}<<[]{}>[{}(",
        "<[[<[{[<[[<<([{}[]][{}<>])<<<>()>([]{})>><((())[(){}])({<>()}{[]()})}>({(([]{})<{}[]>){{(){}}[[][]]}}",
        "<{(<<<<{{({{((()())<<>{}>)([<>()][[]()])}[[{[][]}]<<()<>>[()<>]>]})}<<[<<({}<>>[[]<>]><[()[]]{{}{}}>>]<<",
        "<[[[{<({(<{[((()()))]<{<()>{<><>}}((<>{})[{}[]])>}>)>)<((<<[{([]<>)([]<>)}[[[]{}](()[])]]({{()[]}})>{",
        "{[{[<<[<[<{[{{{}[]}[[]()]}{[[]<>]([]<>)}]<((()<>){<>()}){<[]()>{[]()}}>})<[{<{[]{}}[<>]><([]",
        "<(<{[[{((<({((<>())<()<>>)<(<><>)<(){}>>}]({<[{}{}]{()<>}><<()<>>(<>())>}[{[<>[]][<><>]}<({}()){()()}>",
        "[(([<{<[({{[<[(){}](()[])>]<<<[]()>{{}[]}><{()}(<>())>>}[<[{{}()}[<>{}]]>(<[<>[]]<()[]>>{<()><{}<>",
        "{<[<<[{[([[[{<{}<>>{()[]}}[<[]()>([]<>)]][<{[]{}}{[]<>}>]]{[([(){}]{()<>}>{[<>{}][<>()]}]{<[{}",
        "[[<{<<{{{(<({[<>[]]}{<(){}>[<>[]]}){([[]{}])({[]{}}(<>[]))}><<<{[]()}{<>()}>{(<>)<()[]>}>[[({}<>)((",
        "<(<(({<<[(<[{([]()){[][]}}<(()[])>]><[[{()<>}[()[]]]({{}<>}{<>()})][(<[]()>[{}()])[([]{})[",
        "(<[{<<[{<[([([()[]][[]{}])]{{(()<>)}[[(){}](()<>)]})]>([(([([][])[<>[]]]<<[]<>>>)[{<()[]>(()[])}({<",
        "({(([<<<<<((<{{}{}}<()<>>>[<[][]>[{}<>]])([(<>()){()[]}]<<<><>>[{}<>]>>){([[{}{}][[]()]]<<[][]><[]",
        "(((<{({{([[<<<(){}><{}<>>>>[{{[]<>}(()[])}(<[][]>[()])]]]<(({{{}[]}{<>{}}}[{<>{}}[()()]])[<[{}<>](()",
        "<(([<<{[[{{{{(()[])([]{})}}{<<{}{}>{{}<>}>[{{}{}}<()()>]}}[{[((){})((){}]]}{<(<>[])<{}[]>>[<[]<>>({}<>)]",
        "{([{([{[{<([<<{}()>[(){}]>(<<>{}>[<>{}])])[({[[]()]<[]{}>}<{{}{}}>)<[{<><>}](<[]<>>[{}<>])>]>}]}])[{{{[",
        "[(<{(([{{{({([[][]][()[]])}<<<()[]><()>><(<>{})<<><>>>>)<{[[<><>]<{}[]>]}>}([(<{<><>}{{}[]}>[[<>()](<><>)",
        "(<(((<{(<[({([<>[]]{{}{}}){[[]{}][()<>]}}{[{(){}}[()<>]]<<<>[]>([][])>})][<{<[[]<>]((){})>([<>()]<(){}>)}>]>)",
        "[{{[(({(<<[({{{}{}}<[][]>}([<>][[]{}]))]<<((<>())<()[]>)<({}())<{}[]>>>>>>)}{<<[{[[(<>()){<><>}]<(",
        "<[[[((<{[<{(<[[]()]>){[{()<>}[<>()]]<{<><>}[[]<>]>}}[<([{}{}])({[]<>}[[]])><({()[]}(<>{}))[<",
        "<{<<[<[<(([<{<(){}>({}())}{<<>>[[][]]}>[(<{}()>{(){}})(<[]><{}{}>)]]<((((){}){<><>})<{{}[]}",
        "[(<[<(<{({{<(<{}{}>{{}()})<{[][]}{{}[]}>>(<((){})(()[])>{(<>())})}})<<<[[([]<>)([]<>)]{(<>",
        "(({<[<{{<{<[(({}())[[]{}])<{<>[]}(()<>)>]([(<>[])<[]()>]([[]()){{}()}))>}>[({<(([][])({}{}))<{{}[]}[<>",
        "((({({{[[(<{<<[]()><[]{}>><(()[])[{}()]>}[{[<>()]([])}{{{}{}}<()()]}]>)<{<[[<>{}][[]()]]({<>()}{<><>})>",
        "{[[[[((<<<{[{([][]){<>{}}}[<<>()>([]{})]](<((){})<{}()>><([]())[<><>}>)}{{[[(){}]]{<<>[]><[]{}>}}<({(){",
        "({[[[(({<({[{[<>[]][{}{}]}<<<>>{<>{}}>]<{[{}<>]{()[]}}>}<<([[]{}]({}{}])>{[[<>[]]({}<>)]([{}[]]",
        "{{{({{[{({{<{{()[]}{{}[]}}{<{}{}>}>{(({}())[()<>])((<>{})([]))}}}]<<[(((()<>)<(){}>){[[][]]{{}",
        "{({<{<[{({[{{<<>>[{}{}]}[[<>[]]<{}[]>]}[<[()()]{[]}><([]<>){<>[]}>]]})}[({<[<<{}<>>(()[])>]<({{}(",
        "[{((<{<({[{<[(()()){<><>}](<{}{}>{[][]})>[{<{}()><[]()>}]}][(<({[]{}})>)<<[({}{}){[]()}]{((){}){()[",
        "{<<<{({[(<{<{<()<>>([][]]}<(<>[])[()[]]>>}>)]}[{[{[{[<{}[]>]({()[]}<()()>)}][[[[{}()]{<>{}}][[[",
        "{[{{{{[((<{[[([]<>){{}[]}][<[]{}>({}{})]][[{<>()}[()[]]]<<[]{}><<>{}>>]}{{{[[]<>]<{}()>}[[[]()]{<>()",
        "(([<[[[{{((<(<(){}>[[]<>]){{<><>}([][])}>{[{{}[]}{()[]}]<<{}<>><[]>>}))}({({[[<><>]<[]{}>][{<",
        "[(<({[<[<<(<{([]{})(<>())}<{{}[]}{[]{}}>><(([]<>)[(){}])>)[<{[[]{}]([]{})}[<[][]>(()<>)]>{<{<>()}(()<>)>(<(",
        "[{<(<((<{[(<{<<>()>}<<<>[]><<><>>>><{<()[]><()()>}{[(){}]{[]{}}}>)<{([<>{}][()>)<{[]{}}([][])>}>]({{<({}",
        "({(<[<<{<(((<[{}<>]<<>()>><([]<>)>)[[<<>>{{}<>}](<{}<>>)])[{<[{}]<{}{}>><<[]<>>{[][]}>}}){(({(",
        "(([([{{<<<{({[<>[]]<<>>}({()<>}))({(<>{})(()[])))}((<([]<>){<>[]}>(<[][]>{()<>})){([()()]{(){}})((<>())<{",
        "[{{[<<<((<[([{()<>}<()[]>][(()<>)])({<()<>>({}<>)}{{()<>}{()()}})]>[(<([()[]]<(){}>){[{}<>]{{}{}}}>[([",
        "[(({<[[[<<[[{[()()][{}()]}[[()<>]([]<>)]][<<<><>>[[]<>]><[()<>]<<>()>>]]([{{()[]}{()()}}]{([()[]]({}))<<[]",
        "<[<(<(({<([<<[[]()]<[]<>>>[{[]()}<(){}>]>{<[{}[]]{[]{}}>[<{}<>>]}][<(<{}<>>{()<>})[{<><>}{[]()}]",
        "[{[<<{{{{{{{[{[]<>}{[]{}}]}[[(<>())([][])]<({}[]}[{}[]]>]}{{<<[]<>>[[]<>]>}[[([]{})({}{})]([",
        "({[({[[{{[{[[{<>[]}(()<>)][<()()><[][]>]]{{{<>[]}<<>[]>}<[<>{}]<[][]>>}}<(<{[]{}}[{}{})>([{}{}](<>{})))([({}",
        "<[(<{({<([<[{<(){}><<>[]>}{[[][]]<[][]>}]{<([]{}){[]<>}>}><[[<<>{}><{}[]>]]{<<()<>>{<>()}>({{}<>}<<>[]>)}",
        "<[({({[{[<<{<([]())({}())><[()[]](<>{})>}>{{[(<>{})({}{})]{[[][]]{()[]}}}<{[<>[]]{<>()}}[{<>()}([][]",
        "((({([<[<{{[<<{}[])[{}{}]>({{}()}{()<>})]{<<{}()><<>()>>(((){}){[]<>})}}([([()()]{<>{}}){({}[])[{}",
        "(<((<([{<(<<{<<>[]>[{}{}]}[{<>}([]<>)]>(<{[]{}}{{}()}><(<>[]){()<>}])>{({[()<>]{<>{}}}[[[]<>]{<><>}]){",
        "<({<[[([<<[(<[()[]]>)({(()())(<>{})})]<(<[{}()]{{}[]}>)>>{[[{<<>()>[<>()]}{([]){<>()}}][<<[][]><(){}",
        "((({<[<[{<(([({}()][<>()]]))[<[[()]<{}<>>]({[]()}(<>[]))>]>(<{{<<><>><()()>}({[]()}([]()))}(<{{}()}((){})>({{",
        "[{<<{(<{{{{[{<()[]>(<>())}](({[]{}}{(){}})<({}())[[]<>]>)}{<{[[][]]>{[()()]<<>()>}>[(<{}[]>[()()]",
        "({[((<{<<[(<[{(){}}([]<>)]<(<>{})(<>())>>{{(<><>)(<>())}[<()><{}{}>]}){{{{<>()}<()()>}{[[]",
        "<[[[{([{((<<({[][]}<()[]>)>><[(<<>{}>((){}))]{[<[]{}>({}<>)]({()[]}(<>{}))}>)<({{([]()){{}{}}}})<({<<>{}>{(",
        "<<({<<[[<((<<{{}()}([]()]><{()<>}<<>()>>>({<<>{}>({}<>)}{<[]<>>[<><>]})))<[[<<<><>><()()>>{<<>{}>}]([<",
        "([<{{<(<{{(<{[[]()][{}<>]}[(<><>)]>)}{({[(<>[]){{}{}}]<{{}{}}[(){}]>})[{({(){}}(<>()>)<[[][]][{}<",
        "<[<[([[<<[([{[()<>]<[]<>>}<{()}[()]>])]<{<[<<>[]>[[]()]]<([][]}{<>[]}>>[<<<>{}>>{<{}[]>({}())}]}<[<<[]<>>><",
        "<{<([[(([{<<[{{}()}[<>()]}>{<[<><>](<>{})><<<>[]>>}>(([{()()}(<>())]<[<>{}]>))}]{{{[([[]<>",
        "[{<({<<[((<{<{{}<>}[[][]]>[[{}()]<()[]>]}>{{{{[][]}<[][]>}{({}<>)[(){}]}}(([[]]{()[]})[[()<>]{",
        "<([(<<(([{{<({<><>}{()}}{{<>()}[{}<>]}>[<({}[])(<><>)><{{}[]}((){})>]}<(<{<>{}}({}())>)>}[{(",
        "[{<(<({[[({({<(){}>[[]{}]}({<><>}[[]{}])){[<<>[]><()>]<[{}()]({})>}}[[({{}[]}<{}[]>]]<{<<>[]>(<><>)",
        "[({{<[[<({<{(({}<>)[()[]]){{<>{}}<()[]>}}{(<<>[]>{<>[]})({<>[]}<()[]>)}>><{(<[()][(){}]>){((<>[]){<><>}",
        "({{[{[{<<{((({(){}}){[<>{}]}))<<<{{}[]}{<>[]}>((()[]))>{{<{}{}><()>}[{{}{}}<<><>>]}>}><[(<[((){}){<>()",
        "<[{<([[<[[[{<[<>[]]({}<>)>[{<>[]}[{}{}]]}<{<<>{}><{}>}[{{}()}[[]{}]]>]([(((){})[()[]])[<(){}><()",
        "({{<<<([[([[<(<>{})([][]>>]]([[(()[]){{}()}]][{<()()>[<>{}]}[{[]{}}((){})]]))(<<{<{}><[]>}(<<>()>({}<>))>[",
        "{<{<<[<(([[[<{[]{}}[{}{}]>]{<<()[]>[(){}]>}]]<({<<()[]>{<>[]}>}{<[{}{}]{<>{}}>{[<>()}}})<<<",
        "(({[<[[{<<<({((){})}[{()}({}[])])>>>{{{({(()<>)[[]<>]}[<[]<>>[{}[]]]){[<()[]>][(<><>)]}}}<(((<[]()",
        "<{[({{{<([{[{{{}<>}}]<<[[]]({}{})>>}[<({[][]}<{}[]>)<{{}[]}>>]])>(((((<{()()}<<>[]>><[(){}][<>{",
        "<<(([<<[[[[({<<><>>[{}]}[{{}[]}{[][]}])][((((){}))[<(){}>])[({()()}[[]()))]]]{{[((<>)[{}{}])({{}[]",
        "<<({<{{(<(({<((){}){[]()}>}){{{[{}()]}{(())<[][]>}}<[[()]](<{}()>{{}{}})>}]><<[({{<>[]}[(){}",
        "([{{<[(<[([<[{{}{}}{<>[]}][(<>[])]>](([[()<>]([]())]((()()){{}[]}))<([()<>]<<><>>){<<>{}>(<>{})}>))<{{{<()[",
        "{[[[[([{[{[{{<<>()><(){}>}({<>()}[{}[]])}([{(){}}<{}{}>]({<>[]}(<>[])))]}({[[[()<>]{[][]}]]}<{<{<>()}",
        "[<(([<<((<(((<[]()>{[]{}})<{()<>}([]{})>))<(([(){}]<[]{}>)<<{}>({}())>)((<{}()>{()<>}){({}{})<(){}>})>>((<<(<",
        "[([[({<([(<((({}()))[{{}<>}{()[]}]){{{{}()}(<>{})}<<{}()>{<>{}}>}>)<([[[{}](<>{})]<[[]()]<<>[]>>]",
        "(({(<<[<{(([((()<>)([]()))])<{(([]<>){()<>})[{{}<>}[{}<>]]}>)({([{<><>}({}())])})}(<([([<>{}])<<<",
        "<(([([{[[{{<[<()>](({}()){<>[]})>[[({}[])]{<()<>>{{}}}]}[<{{[]<>}[[]()]}>]}]](([<<{((){})(<>)}{[()[]][(",
        "({(({<<[{{[{<<()[]>{[]()}>([<><>]<{}>)}<(<{}()>[[]()])[<[]}[()]]>]}}{[{(([()()][{}<>]))}<[([[][]][<>{",
        "{(([({<<[[{<(<[]<>>([]<>)][<<>()>[[]<>]]><{(())[(){}]}<(()[]){{}[]}>>}[<[(<><>)(<>[])]<{[]}>><[[()[]][[]]]((<",
        "{{(<[[({(([[(<{}<>>(()())>{<(){}>{<>{}}}]{[{()[]}{[]{}}]}]<[[[<><>][[]<>]][{{}{}}]]<([{}{}]<<><>>)<",
        "[<<{<(<[([[(<<()<>>([]{})>(<{}<>>{[]<>})){<[<>{}]<[][]>>(<()[]><<><>>)}]<([(<>()){<>{}}](<",
        "([[{{([[([{[<<()<>>[()[]}>[[<>[]](<><>)]][{{{}()}{{}{}}}(<(){}>[{}()])]}]){{{{{((){})[{}<>]}<{{}<>}[[]",
        "[[{(({{{<[(<{(<>())<[]<>>}[([][])]>)][<[({()()}(<>())){[{}<>]<[]()>}]}[[{{(){}}{()()}}]{[{{}{}}[{",
        "({<{<{[<<{({{{{}{}}(<>())}<{[]}<{}{}>>}(([[]{}]([]{}))))}>>]}<{{<({[<([]())>(({}<>)<{}<>>)]}<[<(()()}{{}()}",
        "<<[[<[<[[{({<[<>[]][()()]>{<{}()>{<><>}}}[{([][])<()<>>}<{{}()}([][])>])[{[[{}]({}{})]{{[][]}([][])}}",
        "[({[[[[[[({{{<()<>>}}[[(()())({}[])][{[]{}}[()()]]]}{{{{[]()}<[]>}[[<>[]]<<><>>]}<[<{}<>>(<>)]<{<>{}",
        "{[[([([({{[{<{{}[]}{()[]}>}{({<>()})<<<>{}><{}{})>}][[<[{}{}][()<>]>{[[][]][<>[]]}]{[{()[]}[{}()]]({[]<>",
        "{{[[<{({({[[<<<>{}><{}[]>><([][])(()<>)>]]}<([{[<>]<<>{}>}<[{}[]]([][])>][<({}{}>([]<>)>{[<>{}]}])[",
        "({{[{{(({{<({(<><>)<[]{}>}[[{}[]]<[]{}>])>(([{{}()}{[][]}]{{()()}<{}<>>}){<{{}[]}{{}{}}>{(()())}})",
        "{({<{[<<<{<<<{{}()}[[][]]>{<()>(<>())}>>({[[<>[]]<(){}>]<[[]{}]{<><>}>}<[(()[])<<>[]>][<[]()>]>)}({<",
        "{<{([[<[<{{[[[{}<>]<(){}]][<()>(<>{})]]<<<()[]>[<>[]]>>}}{(<{{[]<>}<<>[]>}(<[]<>>)>([{()()}[[]<>",
        "<<((<<<<{<<{({<>[]}({}<>))}(([<><>]{<>()}>([<>[]][(){}]))>><(({<()[]>}({[]<>}[<>[]]))<({(){}}",
        "[{<({<<<{({[{[[]()]<<>>}{{[]()}[<><>]}]}{(({<><>}<[][]>){({}{})(<>{})})})}{<<({(()())<[]()]})([{<><>}<()<",
        "(<((([(<<<<<{[{}{}][{}{}]}(<<><>>[[]<>])>{<{<>{}}<<>()>><{<>[]}[{}{}]>}>(((<<><>>({}())))([<<>[]>]<<{}()>([]",
        "<[{([<<<{{[<<({}())[<>]>[{[]{}}[()]]>{{[<>{}]{<><>}}<({}[]){()<>}>}]}}[{{({{()()}(()[])}<<["
    ]
}
