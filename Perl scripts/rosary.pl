#Rosary
#last edit: 1/15/15

#Press enter for the next line of output
#or type 'auto' to have it done automatically
#include 'all' in your input for extra end prayers
#include 'fast' or 'slow' in your input to toggle speed of output
#include 'wh' if you're praying in the wee hours of the morning and want yesterday's mysteries
#e.g., entering 'autofastallwh' will put it on autopilot at a fast rate of output, include end prayers, and use yesterday's mysteries

use Switch;
($sec,$min,$hour,$mday,$mon,$year,$wday) = localtime(time); #$wday determines the mysteries

$decade=1; #initialize to first decade
$input="";

#####main#####
SotC();
NC();
PN();
HM();
HM();
HM();
GB();
if($input =~ "wh"){ #wee hours
	if($wday == 0){
		$wday = 6;
	}
	else{
		$wday -= 1;
	}
}
Decade();
Decade();
Decade();
Decade();
Decade();
HHQ();
if($input =~ "all"){
	DM();
	PI();
}
SotC();
##############

sub Decade{
	switch($wday){
		case 0 {Glorious($decade);} #Sunday
		case 1 {Joyful($decade);}
		case 2 {Sorrowful($decade);}
		case 3 {Glorious($decade);}
		case 4 {Luminous($decade);}
		case 5 {Sorrowful($decade);}
		case 6 {Joyful($decade);}
	}
	PN();
	for(0..9){
		HM();
	}
	GB();
	F();
	$decade++;
}

#Sign of the Cross
sub SotC{
	r("In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n");
}

#Nicene Creed
sub NC{
	r("I believe in God, the Father Almighty,",
	"Creator of heaven and earth;",
	"and in Jesus Christ, His only Son, our Lord;",
	"Who was conceived by the Holy Spirit,",
	"born of the Virgin Mary, suffered under Pontius Pilate,",
	"was crucified, died, and was buried.",
	"He descended into hell;",
	"the third day He arose again from the dead.",
	"He ascended into heaven,",
	"and is seated at the right hand of God, the Father Almighty;",
	"from thence He shall come to judge the living and the dead.",
	"\tI believe in the Holy Spirit, the Holy Catholic Church,",
	"\tthe communion of Saints, the forgiveness of sins,",
	"\tthe resurrection of the body and life everlasting. Amen.\n");
}

sub Joyful($decade){
	switch($_[0]){
		case 1 {r("The first Joyful Mystery, the Annunciation.");}
		case 2 {r("The second Joyful Mystery, the Visitation.");}
		case 3 {r("The third Joyful Mystery, the Nativity.");}
		case 4 {r("The fourth Joyful Mystery, the Presentation.");}
		case 5 {r("The fifth Joyful Mystery, the Finding of the Child Jesus in the temple.");}
	}
	print "\n";
}

sub Sorrowful($decade){
	switch($_[0]){
		case 1 {r("The first Sorrowful Mystery, the Agony in the Garden.");}
		case 2 {r("The second Sorrowful Mystery, the Scourging at the Pillar.");}
		case 3 {r("The third Sorrowful Mystery, the Crowning with Thorns.");}
		case 4 {r("The fourth Sorrowful Mystery, the Carrying of the Cross.");}
		case 5 {r("The fifth Sorrowful Mystery, the Crucifixion.");}
	}
	print "\n";
}

sub Glorious($decade){
	switch($_[0]){
		case 1 {r("The first Glorious Mystery, the Resurrection.");}
		case 2 {r("The second Glorious Mystery, the Ascension.");}
		case 3 {r("The third Glorious Mystery, the Descent of the Holy Spirit.");}
		case 4 {r("The fourth Glorious Mystery, the Assumption.");}
		case 5 {r("The fifth Glorious Mystery, the Coronation.");}
	}
	print "\n";
}

sub Luminous($decade){
	switch($_[0]){
		case 1 {r("The first Luminous Mystery, the Baptism in the River Jordan.");}
		case 2 {r("The second Luminous Mystery, the Wedding Feast at Cana.");}
		case 3 {r("The third Luminous Mystery, the Proclamation of the Kingdom of Heaven.");}
		case 4 {r("The fourth Luminous Mystery, the Transfiguration.");}
		case 5 {r("The fifth Luminous Mystery, the Institution of the Holy Eucharist.");}
	}
	print "\n";
}

#Pater Noster
sub PN{
	r("Our Father, who art in heaven, hallowed be Thy name;",
	"Thy kingdom come; Thy will be done on earth as it is in heaven.",
	"\tGive us this day our daily bread;",
	"\tand forgive us our trespasses",
	"\tas we forgive those who trespass against us;",
	"\tand lead us not into temptation;",
	"\tbut deliver us from evil. Amen.\n");
}

#Hail Mary
sub HM{
	r("Hail Mary, full of grace, the Lord is with thee.",
	"Blessed art thou among women,",
	"and blessed is the fruit of thy womb, Jesus.",
	"\tHoly Mary, Mother of God, pray for us sinners,",
	"\tnow and at the hour of our death. Amen.\n");
}

#Glory Be
sub GB{
	r("Glory be to the Father, and to the Son, and to the Holy Spirit.",
	"\tAs it was in the beginning, is now, and ever shall be,",
	"\tworld without end. Amen.\n");
}

#Fatima prayer
sub F{
	r("O my Jesus, forgive us our sins",
	"and save us from the fires of hell.",
	"Lead all souls to Heaven,",
	"especially those most in need of your mercy.\n");
}

#Hail, Holy Queen
sub HHQ{
	r("Hail, Holy Queen, Mother of Mercy,",
		"our life, our sweetness, and our hope!",
		"To thee do we cry, poor banished children of Eve;",
		"to thee do we send up our sighs,",
		"mourning, and weeping in this valley of tears.",
		"Turn then, most gracious advocate, thine eyes of mercy toward us,",
		"and after this our exile,",
		"show unto us the blessed fruit of thy womb, Jesus.",
		"O clement, O loving, O sweet Virgin Mary!",
		"\tPray for us, O Holy Mother of God.",
		"\tThat we may be made worthy of the promises of Christ.",
		"Let us pray. O God, whose only begotten Son,",
		"by His life, death, and resurrection,",
		"has purchased for us the rewards of eternal life,",
		"grant, we beseech Thee,",
		"that by meditating upon these mysteries",
		"of the Most Holy Rosary of the Blessed Virgin Mary,",
		"we may imitate what they contain and obtain what they promise,",
		"through the same Christ Our Lord. Amen.\n");
}

sub DM{
	r("May the Divine Assistance remain with us,",
		"and may the souls of the faithful departed,",
		"through the mercy of God, rest in peace. Amen.\n");
}

sub PI{ #Pope's intentions
	r("For the Pope's intentions:");
	PN();
	HM();
	GB();
}

#prints whatever is passed to it and then prompts for input (unless user types "auto" "skip" or "end")
sub r{
	$b=0;
	for(@_){
		if($input =~ "auto"){ #prints at a rate determined by the length of the segment of text
			print $_, "\n";     #however, does not allow for input afterwards
			if($input =~ "fast"){
				$s = length($_)/27; #typing 'autofast' will enable this speed
			}
			elsif($input =~ "slow"){
				$s = length($_)/16.5;
			}
			else {
				$s = length($_)/23;
			}
			select(undef, undef, undef, $s);
		}
		elsif($input eq "end\n"){ #spits out everything without waiting
			print $_, "\n"; 
		}
		elsif($input eq "skip\n"){ #skips the current prayer without waiting
			print $_, "\n";
			$b++;
			if($b==@_){
				$input=<>;
			}
		}
		else{
			print;
			$input=<>; #waits for input before printing next segment
		}
	}
}