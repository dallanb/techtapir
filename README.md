# Huncho

# Clone Repo

1. `> ssh-keygen -t rsa -b 4096 -C "dallan.bhatti@techtapir.com" -f $HOME/.ssh/github`
2. `> cat $HOME/.ssh/github.pub`
3. Copy and Paste the output into Github Profile
4. `> ssh-agent bash -c 'ssh-add $HOME/.ssh/github; git clone git@github.com:dallanb/huncho.git`
