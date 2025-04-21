def allMatches(teamList):
    matchList = []
    
    for team1 in teamList:
        for team2 in teamList:
            if team1 != team2:
                matchList.append((team1, team2))
                
    return matchList

def main():
    
    matches = allMatches(['FCP', 'SLB', 'SCP', 'FCA'])
    print(matches)
    print(len(matches))
    
    
    
main()
    