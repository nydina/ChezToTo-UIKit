import UIKit

class MenuViewController: UITableViewController {
    let sections = ["Entrée", "Pizza"]

    let entreeItems = [
        ("Entrée 1", "Description 1", "$10.99", "entree1"),
        ("Entrée 2", "Description 2", "$12.99", "entree2")
    ]

    let pizzaItems = [
        ("Pizza 1", "Description 1", "$15.99", "pizza1"),
        ("Pizza 2", "Description 2", "$18.99", "pizza2"),
        ("Pizza 3", "Description 3", "$20.99", "pizza3"),
        ("Pizza 4", "Description 4", "$22.99", "pizza4")
    ]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return entreeItems.count
        case 1:
            return pizzaItems.count
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell

        switch indexPath.section {
        case 0:
            let (title, description, price, imageName) = entreeItems[indexPath.row]
            cell.configureCell(title: title, description: description, price: price, imageName: imageName)
        case 1:
            let (title, description, price, imageName) = pizzaItems[indexPath.row]
            cell.configureCell(title: title, description: description, price: price, imageName: imageName)
        default:
            break
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}

class MenuCell: UITableViewCell {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    func configureCell(title: String, description: String, price: String, imageName: String) {
        itemImageView.image = UIImage(named: imageName)
        titleLabel.text = title
        descriptionLabel.text = description
        priceLabel.text = price
    }
}

